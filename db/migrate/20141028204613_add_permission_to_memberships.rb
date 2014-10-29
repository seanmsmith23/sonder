class AddPermissionToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :permission, :boolean, default: true
  end
end
