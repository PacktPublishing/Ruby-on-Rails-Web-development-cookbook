class TodosController < ApplicationController
  before_action :set_project

  def create
    @todo = @project.todos.new(todo_params)
    if @todo.save
      redirect_to project_path(@project)
    else
      @projects = Project.all
      render 'projects/show'
    end
  end

  def update
    @todo = @project.todos.find(params[:id])
    if @todo.update(todo_params)
      redirect_to project_path(@project)
    else
      @projects = Project.all
      @todo = @project.todos.new
      render 'projects/show'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:content, :completed)
  end
end