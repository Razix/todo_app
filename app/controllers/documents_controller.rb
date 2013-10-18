class DocumentsController < ApplicationController
  respond_to :html, :json
  before_filter :load_todo
  before_filter :load_document, only: [:edit, :update, :destroy]
  before_filter :load_project, only: [:create, :edit, :update, :destroy]

  def index
    @documents = @todo.documents.order(:id)
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = @todo.documents.build
  end

  def create
    @document = @todo.documents.new(params[:document])
    flash[:notice] = 'Document was successfully uploaded.' if @document.save
    respond_with [@project, @todo]
  end

  def edit
  end

  def update
    flash[:notice] = 'Document was successfully updated.' if @document.update_attributes(params[:document])
    respond_with [@project, @todo]
  end

  def destroy
    @document.destroy
    respond_with [@project, @todo]
  end

  private

    def load_project
      @project = @todo.project
    end

    def load_todo
      @todo = Todo.find(params[:todo_id])
    end

    def load_document
      @document = @todo.documents.find(params[:id])
    end

end
