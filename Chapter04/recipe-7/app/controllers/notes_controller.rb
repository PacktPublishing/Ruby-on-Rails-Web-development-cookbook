class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_variant

  def index
    @notes = Note.order(updated_at: :desc)
    @note = Note.new
  end

  def show
    respond_to do |format|
      format.html
      format.turbo_stream { 
        render turbo_stream: turbo_stream.update("note-content", partial: "notes/show", locals: { note: @note })
      }
    end
  end


  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.append("notes-list", partial: "notes/note", locals: { note: @note }),
            turbo_stream.update("new-note-form", partial: "notes/form", locals: { note: Note.new })
          ]
        }
      else
        format.turbo_stream { 
          render turbo_stream: turbo_stream.update("new-note-form", partial: "notes/form", locals: { note: @note })
        }
      end
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: turbo_stream.update("note-content", partial: "notes/form", locals: { note: @note })
      }
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.replace(@note, partial: "notes/note", locals: { note: @note }),
            turbo_stream.update("note-content", partial: "notes/show", locals: { note: @note })
          ]
        }
      else
        format.turbo_stream { 
          render turbo_stream: turbo_stream.update("note-content", partial: "notes/form", locals: { note: @note })
        }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: [
          turbo_stream.remove(@note),
          turbo_stream.update("note-content", partial: "notes/welcome")
        ]
      }
    end
  end

  private

  def set_variant
    request.variant = :phone if request.user_agent =~ /iPhone|Android.*Mobile/i
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
