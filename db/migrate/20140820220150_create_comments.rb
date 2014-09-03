class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :memorial_id
      t.text :story
      t.timestamps
    end
  end
end
