class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :brand
      t.string :model
      t.string :body_type
      t.integer :trip
      t.string :color
      t.float :price
      t.string :fuel
      t.integer :year
      t.float :engine_capacity
      t.string :phone_number
      t.string :name
      t.string :image
      t.integer :status

      t.timestamps
    end
  end
end
