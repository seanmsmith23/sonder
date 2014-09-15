class LikesController < ApplicationController
  def create
    like = Like.new(
      likeable_id: params[:content_id],
      likeable_type: params[:content_type],
      user_id: current_user.id
    )
    if like.save
      render nothing: true
    end
  end

  def destroy
    like = Like.where(user_id: current_user.id, likeable_id: params[:content_id], likeable_type: params[:content_type])
    like.destroy_all
    render nothing: true
  end
end
