class TodosController < ApplicationController
  respond_to :html, :json
  load_and_authorize_resource

  def index
    @todos = current_user.todos
    respond_with @todos
  end

  def show
  end

  def new
    @todo = current_user.todos.build
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(params[:todo])
    flash[:notice] = 'Todo was successfully created.' if @todo.save
    respond_with @todo
  end

  def update
    flash[:notice] = 'Todo was successfully updated.' if @todo.update_attributes(params[:todo])
    respond_with @todo
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end
end
