class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :memorial_id
      t.integer :user_id
      t.timestamps
    end
  end
end
