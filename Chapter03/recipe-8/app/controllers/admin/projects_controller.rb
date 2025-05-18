module Admin
  class ProjectsController < ApplicationController
    # GET /admin/projects
    def index
      @projects = Project.order(:id)
    end

    # GET /admin/projects/:id/edit
    def edit
      @project = Project.find(params[:id])
    end

    # PATCH/PUT /admin/projects/:id
    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to admin_projects_path, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/projects/:id
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to admin_projects_path, notice: 'Project was successfully deleted.'
    end

    private

    def project_params
      params.require(:project).permit(:name)
    end
  end
end