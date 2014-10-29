class UserPermissionsController < ApplicationController
  def update
    membership = Membership.where(memorial_id: params[:memorial_id], user_id: params[:id])
    membership.first.flip_permission
    redirect_to memorial_path(params[:memorial_id])
  end
end
