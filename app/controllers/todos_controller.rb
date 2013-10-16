class TodosController < ApplicationController
  respond_to :html, :json
  before_filter :load_project
  before_filter :todo_variable, only: [:show, :edit, :update, :destroy]

  def index
    @todos = @project.todos.order(:id)
  end

  def show
  end

  def new
    @todo = @project.todos.build
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
    redirect_to project_todos_url
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end

    def todo_variable
      @todo = @project.todos.find(params[:id])
    end

end
