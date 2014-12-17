class ProjectsController < ApplicationController
  def index   
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project created"
      redirect_to @project #project_path(@project)
    else
      flash[:alert] = "Project not created"
      render "new"
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
