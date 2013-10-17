class CommentsController < ApplicationController
  respond_to :html, :json, :js
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.create(params[:comment])
    respond_with @commentable
  end

  private

    def load_commentable
      klass = [Project, Todo].detect { |c| params["#{c.name.underscore}_id"] }
      @commentable = klass.find(params["#{klass.name.underscore}_id"])
    end

end
