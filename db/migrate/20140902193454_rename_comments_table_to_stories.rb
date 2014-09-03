class RenameCommentsTableToStories < ActiveRecord::Migration
  def change
    rename_table :comments, :stories
  end
end
