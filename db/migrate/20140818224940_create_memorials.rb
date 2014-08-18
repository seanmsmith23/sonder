class CreateMemorials < ActiveRecord::Migration
  def change
    create_table :memorials do |t|
      t.integer :user_id
      t.string :name
      t.date :born
      t.date :died
      t.timestamps
    end
  end
end
