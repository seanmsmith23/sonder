class MemorialsController < ApplicationController

  def index
    @memorials = Memorial.where(user_id: current_user.id)
  end

  def new
    @memorial = Memorial.new
  end

  def create
    date_present?(:born) ? born = parse_date(:born) : born = ""
    date_present?(:died) ? died = parse_date(:died) : died = ""

    @memorial = Memorial.new(name: params[:memorial][:name], born: born, died: died, user_id: current_user.id)

    if @memorial.save
      Membership.create(memorial: @memorial, user: current_user)
      Administrator.create(memorial_id: @memorial.id, user_id: current_user.id)
      redirect_to new_memorial_image_path(@memorial)
    else
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


  def date_present?(type)
    params[:memorial][type].present?
  end

  def parse_date(type)
    Date.strptime(params[:memorial][type], "%m/%d/%Y")
  end

end
