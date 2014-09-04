class MemorialsController < ApplicationController

  def index
    @memorials = Memorial.where(user_id: current_user.id)
  end

  def new
    @memorial = Memorial.new
  end

  def create
    born = Date.strptime(params[:memorial][:born], "%m/%d/%Y")
    died = Date.strptime(params[:memorial][:died], "%m/%d/%Y")

    @memorial = Memorial.new(name: params[:memorial][:name], born: born, died: died, user_id: current_user.id)

    if @memorial.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    check_user_membership(params[:id], current_user.id)
    @memorial = Memorial.find(params[:id])
    @stories = Story.where(memorial_id: params[:id])
    @story = Story.new
    @storylikes = Storylike.where(memorial_id: params[:id])
    @post = Post.new
  end

  def update

  end

  def destroy

  end

  def find
    @memorials = Memorial.all
  end

  ## helper methods

  def check_user_membership(memorial_id, user_id)
    unless Memorial.find(memorial_id).users.find_by_id(user_id)
      redirect_to new_memorial_membership_path(memorial_id: memorial_id)
    end
  end

end
