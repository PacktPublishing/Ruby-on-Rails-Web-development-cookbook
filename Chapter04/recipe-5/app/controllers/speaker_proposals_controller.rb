class SpeakerProposalsController < ApplicationController
  def new
    @speaker_proposal = SpeakerProposal.new
  end

  def create
    @speaker_proposal = SpeakerProposal.new(speaker_proposal_params)
    if @speaker_proposal.save
      redirect_to new_speaker_proposal_path, notice: "Proposal submitted!"
    else
      unless @speaker_proposal.errors.attribute_names.include?(:base)
        @speaker_proposal.errors.add :base, "Please review the highlighted fields and try again."
      end
      render :new
    end
  end

  private

  def speaker_proposal_params
    params.require(:speaker_proposal).permit(:event_id, :name, :email, :talk_title, :talk_description, :track, :audience_level, :bio, :duration, :terms_of_participation)
  end
end

