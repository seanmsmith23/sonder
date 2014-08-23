class CreateLikesTable < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :comment_id
      t.integer :user_id
      t.integer :memorial_id
    end
  end
end
