class ImagesController < ApplicationController
  def create
    @image = Image.create(
      image: params[:image][:image],
      memorial_id: params[:memorial_id],
      user_id: current_user.id,
      subtitle: params[:image][:subtitle]
    )

    if @image.save
      redirect_to memorial_path(params[:memorial_id])
    end
  end

  def destroy
    image = Image.where(memorial_id: params[:memorial_id], id: params[:id])
    image.destroy_all
    redirect_to memorial_path(params[:memorial_id])
  end
end
