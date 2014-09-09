class ImagesController < ApplicationController
  def create
    @image = Image.create(image: params[:image][:image], memorial_id: params[:memorial_id], user_id: current_user.id)
    if @image.save
      redirect_to memorial_path(params[:memorial_id])
    end
  end
end
