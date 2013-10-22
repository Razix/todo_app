class TodosController < ApplicationController
  respond_to :html, :json, :js
  before_filter :load_project
  before_filter :load_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = @project.todos.order(:id)
  end

  def show
    @documents = @todo.documents.order(:id)
    @comments = @todo.comments
    @comment = Comment.new
  end

  def new
    @todo = @project.todos.build
    @document = @todo.documents.build
  end

  def edit
  end

  def create
    @todo = @project.todos.new(params[:todo])
    flash[:notice] = 'Todo was successfully created.' if @todo.save
    respond_with [@project, @todo]
  end

  def update
    flash[:notice] = 'Todo was successfully updated.' if @todo.update_attributes(params[:todo])
    respond_with [@project, @todo]
  end

  def destroy
    @todo.destroy
    respond_with [@project, @todo]
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end

    def load_todo
      @todo = @project.todos.find(params[:id])
    end

end
