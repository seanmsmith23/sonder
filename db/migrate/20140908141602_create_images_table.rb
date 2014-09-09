class CreateImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :memorial_id
      t.integer :user_id
      t.string :image
    end
  end
end
