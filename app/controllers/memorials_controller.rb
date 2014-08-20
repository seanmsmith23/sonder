class MemorialsController < ApplicationController
  def new
    @memorial = Memorial.new
  end

  def index
    @memorials = Memorial.where(user_id: current_user.id)
  end

  def create
    born = Date.strptime(params[:memorial][:born], "%m/%d/%Y")
    died = Date.strptime(params[:memorial][:died], "%m/%d/%Y")

    @memorial = Memorial.new(name: params[:memorial][:name], born: born, died: died, user_id: current_user.id)

    p '*'*80
    p "CURRENT USER: #{current_user.id}"

    if @memorial.save
      redirect_to root_path
    else
      render 'new'
    end

  end

end
