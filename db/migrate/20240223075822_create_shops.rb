class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :url
      t.string :opening_hours
      t.integer :chain

      t.timestamps
    end
  end
end
