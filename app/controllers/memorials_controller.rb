class MemorialsController < ApplicationController

  def index
    @memorials = Memorial.where(user_id: current_user.id)
  end

  def new
    @memorial = Memorial.new
    1.times { @memorial.images.build }
  end

  def create

    if dates_present?
      born = parse_date(:born)
      died = parse_date(:died)
    else
      born = ""
      died = ""
    end

    @memorial = Memorial.new(name: params[:memorial][:name], born: born, died: died, user_id: current_user.id)

    if @memorial.save
      @images = params[:memorial][:images_attributes].map do |key, value|
        Image.new(user_id: current_user.id, memorial_id: @memorial.id, background: true, subtitle: value[:subtitle], image: value[:image])
      end
      if all_images_save?(@images)
        render :crop
      else
        1.times { @memorial.images.build }
        render :new
      end
    else
      1.times { @memorial.images.build }
      render :new
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

  def all_images_save?(images)
    result = true
    images.each do |image|
      if image.save
        result = true
      else
        result = false
        break
      end
    end
    result
  end

  def dates_present?
    params[:memorial][:born].present? && params[:memorial][:died].present?
  end

  def parse_date(type)
    Date.strptime(params[:memorial][type], "%m/%d/%Y")
  end

end
