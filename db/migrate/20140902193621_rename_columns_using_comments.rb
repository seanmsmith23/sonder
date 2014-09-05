class RenameColumnsUsingComments < ActiveRecord::Migration
  def change
    rename_column :likes, :comment_id, :story_id
  end
end
