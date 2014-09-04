class PostsController < ApplicationController
  def create
    post = Post.new(user_id: current_user.id, memorial_id: params[:memorial_id], content: params[:post][:content])
    if post.save
      redirect_to memorial_path(id: params[:memorial_id])
    else
      @memorial = Memorial.find(params[:memorial_id])
      render 'memorials/show'
    end
  end
end
