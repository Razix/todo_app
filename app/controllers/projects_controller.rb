class ProjectsController < ApplicationController
  respond_to :html, :json, :js
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @projects = current_user.projects.order(:id).page(params[:page]).per(2)
  end

  def show
    @incomplete_todos = @project.todos.incomplete.page(params[:page]).per(2)
    @complete_todos = @project.todos.complete.page(params[:page_2]).per(3)
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
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

  def incomplete
    @incomplete_todos = @project.todos.incomplete.page(params[:page]).per(2)
  end

  def complete
    @complete_todos = @project.todos.complete.page(params[:page]).per(3)
  end

end
