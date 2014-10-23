class CropController < ApplicationController
  def new
    @images = Image.where(memorial_id: params[:memorial_id], background: true)
  end

  def update
    image = Image.find(params[:id])

    if crop_params_present?
      assign_crop_values(image)
      image.crop_image
    else
      image.update(allowed_params)
    end

    render nothing: true
    # render js: "window.location = '#{memorial_path(params[:memorial_id])}'"
  end

  private

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
