class ImagesController < ApplicationController
  def new
    @image = Image.new(memorial_id: params[:memorial_id], background: true, user_id: current_user)
  end

  def create
    @image = Image.create(allowed_params)

    if @image.save
      if @image.is_background?
        redirect_to new_memorial_image_path(params[:memorial_id])
      else
        redirect_to memorial_path(params[:memorial_id])
      end
    else
      @memorial_page = MemorialPage.new(params[:memorial_id])
      render 'memorials/show'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])

    image.update(allowed_params)

    redirect_to memorial_path(params[:memorial_id])
  end

  def destroy
    image = Image.where(memorial_id: params[:memorial_id], id: params[:id])
    image.destroy_all
    redirect_to memorial_path(params[:memorial_id])
  end

  def add
    respond_to do |format|
      format.js
    end
  end

  private

  def allowed_params
    params.require(:image).permit(:subtitle, :image, :background).merge(user_id: current_user.id, memorial_id: params[:memorial_id])
  end

end
