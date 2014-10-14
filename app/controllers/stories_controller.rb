class StoriesController < ApplicationController
  def create
    @story = Story.new(user_id: current_user.id, memorial_id: params[:memorial_id], story: params[:story][:story])
    if @story.save
      redirect_to memorial_path(id: params[:memorial_id])
    else
      @memorial = Memorial.find(params[:memorial_id])
      render 'memorials/show'
    end
  end

  def destroy
    story = Story.where(memorial_id: params[:memorial_id], id: params[:id])
    story.destroy_all
    redirect_to memorial_path(params[:memorial_id])
  end
end
