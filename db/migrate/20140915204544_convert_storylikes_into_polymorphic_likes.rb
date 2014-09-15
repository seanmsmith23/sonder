class ConvertStorylikesIntoPolymorphicLikes < ActiveRecord::Migration
  def change
    drop_table :storylikes

    create_table :likes do |t|
      t.references :likeable, polymorphic: true
      t.integer :user_id
    end
  end
end
