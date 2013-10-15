class TodosController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!

  def index
    if current_user
      @todos = current_user.todos
      respond_with @todos
    end
  end

  def show
    @todos = current_user.todos
    @todo = Todo.find(params[:id])
    redirect_to todos_path unless @todo.user == current_user
  end

  def new
    @todo = Todo.new
    respond_with @todo
  end

  def edit
    @todo = Todo.find(params[:id])
    redirect_to todos_path unless @todo.user == current_user
  end

  def create
    @user = current_user
    @todo = @user.todos.new(params[:todo])
    flash[:notice] = 'Todo was successfully created.' if @todo.save
    respond_with @todo
  end

  def update
    @todo = Todo.find(params[:id])
    flash[:notice] = 'Todo was successfully updated.' if @todo.update_attributes(params[:todo])
    respond_with @todo
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_url
  end
end
