class StoriesController < ApplicationController
  def create
    @story = Story.new(user_id: current_user.id, memorial_id: params[:memorial_id], story: params[:story][:story])
    if @story.save
      redirect_to memorial_path(id: params[:memorial_id])
    else
      @memorial_page = MemorialPage.new(params[:memorial_id])
      render 'memorials/show'
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    story = Story.find(params[:id])
    story.update(story: params[:story][:story])
    redirect_to memorial_path(params[:memorial_id])
  end

  def destroy
    story = Story.where(memorial_id: params[:memorial_id], id: params[:id])
    story.destroy_all
    redirect_to memorial_path(params[:memorial_id])
  end
end
