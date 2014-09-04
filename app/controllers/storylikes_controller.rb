class StorylikesController < ApplicationController
  def create
    storylike = Storylike.new(
      story_id: params[:id],
      memorial_id: params[:memorial_id],
      user_id: current_user.id
    )
    if storylike.save
      render nothing: true
    end
  end

  def destroy
    storylike = Storylike.where(user_id: current_user.id, story_id: params[:id])
    storylike.destroy_all
    render nothing: true
  end
end
