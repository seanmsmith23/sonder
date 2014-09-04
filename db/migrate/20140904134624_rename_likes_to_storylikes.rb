class RenameLikesToStorylikes < ActiveRecord::Migration
  def change
    rename_table :likes, :storylikes
  end
end
