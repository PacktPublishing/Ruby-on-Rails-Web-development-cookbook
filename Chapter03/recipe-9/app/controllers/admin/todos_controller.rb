module Admin
  class TodosController < ApplicationController
    # GET /admin/todos
    def index
      @todos = Todo.includes(:project).order(:id)
    end

    # GET /admin/todos/:id/edit
    def edit
      @todo = Todo.find(params[:id])
    end

    # PATCH/PUT /admin/todos/:id
    def update
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        redirect_to admin_todos_path, notice: 'Todo was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/todos/:id
    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to admin_todos_path, notice: 'Todo was successfully deleted.'
    end

    private

    def todo_params
      params.require(:todo).permit(:content, :completed)
    end
  end
end