class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user_id: current_user.id, memorial_id: params[:memorial_id], comment: params[:comment][:comment])
    if @comment.save
      redirect_to memorial_path(id: params[:memorial_id])
    else
      @memorial = Memorial.find(params[:memorial_id])
      render 'memorials/show'
    end
  end
end
