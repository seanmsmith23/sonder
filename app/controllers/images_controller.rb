class ImagesController < ApplicationController
  def create
    @image = Image.create(allowed_params)

    if @image.save
      redirect_to memorial_path(params[:memorial_id])
    else
      render 'memorials/show'
    end

  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])

    if crop_params_present?
      assign_crop_values(image)
      image.crop_image
    else
      image.update(allowed_params)
    end

    redirect_to memorial_path(params[:memorial_id])
  end

  def destroy
    image = Image.where(memorial_id: params[:memorial_id], id: params[:id])
    image.destroy_all
    redirect_to memorial_path(params[:memorial_id])
  end

  private

  def allowed_params
    permit(:image).require(:subtitle, :memorial_id, :user_id, :image)
  end

  def crop_params_present?
    params[:image][:crop_x]
  end

  def assign_crop_values(image)
    image.crop_x = params[:image][:crop_x]
    image.crop_y = params[:image][:crop_y]
    image.crop_w = params[:image][:crop_w]
    image.crop_h = params[:image][:crop_h]
  end

end
