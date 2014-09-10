class AddTextColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :subtitle, :text
  end
end
