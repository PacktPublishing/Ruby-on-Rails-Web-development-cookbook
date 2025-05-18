class ProjectsController < ApplicationController
  def index
    # Only show the current user's projects
    @projects = Current.user.projects
    if @projects.any?
      redirect_to project_path(@projects.first) and return
    else
      # No projects yet → go to creation form
      redirect_to new_project_path and return
    end
  end

  def show
    # Only show the current user's projects
    @projects = Current.user.projects
    @project = @projects.find(params[:id])
  end

  def new
    # Build a new project scoped to the current user
    @project = Current.user.projects.new
  end

  def create
    # Create the project under the current user
    @project = Current.user.projects.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end

