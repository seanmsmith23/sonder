class MemorialsController < ApplicationController

  def index
    @memorials = Memorial.where(user_id: current_user.id)
  end

  def new
    @memorial = Memorial.new
    3.times { @memorial.images.build }
  end

  def create
    born = Date.strptime(params[:memorial][:born], "%m/%d/%Y")
    died = Date.strptime(params[:memorial][:died], "%m/%d/%Y")

    @memorial = Memorial.new(name: params[:memorial][:name], born: born, died: died, user_id: current_user.id)

    subtitle1 = params[:memorial][:images_attributes]["0"][:subtitle]
    image1 = params[:memorial][:images_attributes]["0"][:image]

    subtitle2 = params[:memorial][:images_attributes]["1"][:subtitle]
    image2 = params[:memorial][:images_attributes]["1"][:image]

    subtitle3 = params[:memorial][:images_attributes]["2"][:subtitle]
    image3 = params[:memorial][:images_attributes]["2"][:image]


    if @memorial.save
      @image1 = Image.new(user_id: current_user.id, memorial_id: @memorial.id, background: true, subtitle: subtitle1, image: image1)
      @image2 = Image.new(user_id: current_user.id, memorial_id: @memorial.id, background: true, subtitle: subtitle2, image: image2)
      @image3 = Image.new(user_id: current_user.id, memorial_id: @memorial.id, background: true, subtitle: subtitle3, image: image3)
      if @image1.save && @image2.save && @image3.save
        redirect_to root_path
      else
        3.times { @memorial.images.build }
        render 'new'
      end
    else
      3.times { @memorial.images.build }
      render 'new'
    end
  end

  def show
    check_user_membership(params[:id], current_user.id)
    @images = Image.all
    @memorial_page = MemorialPage.new(params[:id])
  end

  def update

  end

  def destroy

  end

  def find
    @memorials = Memorial.all
  end

  private

  def check_user_membership(memorial_id, user_id)
    unless Memorial.find(memorial_id).users.find_by_id(user_id)
      redirect_to new_memorial_membership_path(memorial_id: memorial_id)
    end
  end

end
