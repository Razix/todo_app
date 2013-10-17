class ProjectsController < ApplicationController
  respond_to :html, :json
  load_and_authorize_resource

  def index
    @projects = current_user.projects.order(:id)
  end

  def show
    @todos = @project.todos.order(:id)
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.new(params[:project])
    flash[:notice] = 'Project was successfully created.' if @project.save
    respond_with @project
  end

  def update
    flash[:notice] = 'Project was successfully updated.' if @project.update_attributes(params[:project])
    respond_with @project
  end

  def destroy
    @project.destroy
    redirect_to projects_url
  end
end
