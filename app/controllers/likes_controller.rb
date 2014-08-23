class LikesController < ApplicationController
  def create
    like = Like.new(
      comment_id: params[:id],
      memorial_id: params[:memorial_id],
      user_id: current_user.id
    )
    if like.save
      render nothing: true
    end
  end

  def destroy
    like = Like.where(user_id: current_user.id, comment_id: params[:id])
    like.destroy_all
    render nothing: true
  end
end
