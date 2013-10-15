class TagsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!

  def index
    @tags = Tag.all
    respond_with @tags
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
    respond_with @tag
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(params[:tag])
    flash[:notice] = 'Tag was successfully created.' if @tag.save
    respond_with @tag
  end

  def update
    @tag = Tag.find(params[:id])
    flash[:notice] = 'Tag was successfully updated.' if @tag.update_attributes(params[:tag])
    respond_with @tag
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_url
  end
end
