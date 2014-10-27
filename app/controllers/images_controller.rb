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
    params.require(:image).permit(:subtitle, :image).merge(user_id: current_user.id, memorial_id: params[:memorial_id])
  end

end
