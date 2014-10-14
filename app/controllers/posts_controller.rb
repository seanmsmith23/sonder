class PostsController < ApplicationController
  def create
    @post = Post.new(user_id: current_user.id, memorial_id: params[:memorial_id], content: params[:post][:content], title: params[:post][:title])
    if @post.save
      redirect_to memorial_path(id: params[:memorial_id])
    else
      render 'memorials/show'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(content: params[:post][:content], title: params[:post][:title])
    redirect_to memorial_path(params[:memorial_id])
  end

  def destroy
    post = Post.where(memorial_id: params[:memorial_id], id: params[:id])
    post.destroy_all
    redirect_to memorial_path(params[:memorial_id])
  end
end
