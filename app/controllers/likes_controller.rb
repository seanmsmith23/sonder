class LikesController < ApplicationController
  def create
    like = Like.new(comment_id: params[:id])
    if like.save
      render nothing: true
    end
  end
end
