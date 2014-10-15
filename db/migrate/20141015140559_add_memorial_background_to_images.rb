class AddMemorialBackgroundToImages < ActiveRecord::Migration
  def change
    add_column :images, :background, :boolean, default: false
  end
end
