class TagsController < ApplicationController
  respond_to :html, :json
  load_and_authorize_resource

  def index
    @tags = current_user.tags
    respond_with @tags
  end

  def show
  end

  def new
    @tag = current_user.tags.build
  end

  def edit
  end

  def create
    @tag = current_user.tags.new(params[:tag])
    flash[:notice] = 'Tag was successfully created.' if @tag.save
    respond_with @tag
  end

  def update
    flash[:notice] = 'Tag was successfully updated.' if @tag.update_attributes(params[:tag])
    respond_with @tag
  end

  def destroy
    @tag.destroy
    redirect_to tags_url
  end
end
