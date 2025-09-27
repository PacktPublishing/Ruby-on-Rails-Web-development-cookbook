class TasksController < ApplicationController
  def create
    list = List.find params[:list_id]
    @task = Task.new list: list, title: params[:task][:title]

    if @task.save
      redirect_to lists_path(list)
    else
      redirect_to lists_path(list), status: :unprocessable_entity,
        alert: "Task could not be created"
    end
  end
end
