class DocumentsController < ApplicationController
  respond_to :html, :json
  before_filter :load_todo
  before_filter :load_document, only: :destroy

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
    @project = @todo.project
    @document = @todo.documents.new(params[:document])
    flash[:notice] = 'Document was successfully uploaded.' if @document.save
    respond_with [@todo, @document], location: project_todo_path(@project, @todo)
  end

  def destroy
    @project = @todo.project
    @document.destroy
    redirect_to project_todo_url(@project, @todo)
  end

  private

    def load_todo
      @todo = Todo.find(params[:todo_id])
    end

    def load_document
      @document = @todo.documents.find(params[:id])
    end

end
