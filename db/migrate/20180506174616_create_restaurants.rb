class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :imageUrl
      t.string :location
      t.integer :minPrice
      t.integer :maxPrice

      t.timestamps
    end
  end
end
