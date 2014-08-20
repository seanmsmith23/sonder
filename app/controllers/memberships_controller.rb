class MembershipsController < ApplicationController
  def new
    @memorial = Memorial.find(params[:memorial_id])
  end

  def create
    @member = Membership.new(user_id: current_user.id, memorial_id: params[:memorial_id])
    @member.save
    redirect_to memorial_path(id: params[:memorial_id])
  end
end
