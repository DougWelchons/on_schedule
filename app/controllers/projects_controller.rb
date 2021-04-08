class ProjectsController < ApplicationController

  def index; end

  def show; end

  def new; end

  def create
    project = Project.new(project_params)
    if project.save
      # create_user_project(current_user, project, "admin")

      redirect_to company_project_path(current_company, project)
    else
      flash.now(error: "Unable to create project")
      render new_company_project_path(current_company)
    end
  end

  private
  def project_params
    params.permit(:name, :start_date, :end_date, :company_id)
  end
end
