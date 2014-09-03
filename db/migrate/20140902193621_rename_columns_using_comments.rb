class RenameColumnsUsingComments < ActiveRecord::Migration
  def change
    rename_column :likes, :comment_id, :story_id
    rename_column :stories, :comment, :story
  end
end
