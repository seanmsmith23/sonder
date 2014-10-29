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
    memorial = Memorial.find(params[:id])
    check_user_permissions(memorial)
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

  def check_user_permissions(memorial)
    if current_user.has_not_joined_memorial?(memorial)
      redirect_to new_memorial_membership_path(memorial_id: memorial.id)
    elsif current_user.is_blocked?(memorial)
      redirect_to root_path
    end
  end

  def date_present?(type)
    params[:memorial][type].present?
  end

  def parse_date(type)
    Date.strptime(params[:memorial][type], "%m/%d/%Y")
  end

end
