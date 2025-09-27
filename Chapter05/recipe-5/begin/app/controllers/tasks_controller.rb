class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:update, :destroy, :toggle_completed]

  def create
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to @list, notice: "Task created successfully"
    else
      render "lists/show", status: :unprocessable_content
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @list
    else
      redirect_to @list, alert: "Task could not be updated"
    end
  end

  def destroy
    @task.destroy
    redirect_to @list, notice: "Task deleted successfully"
  end

  def toggle_completed
    @task.update(completed: !@task.completed?)
    redirect_to @list
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :due_on)
  end
end
