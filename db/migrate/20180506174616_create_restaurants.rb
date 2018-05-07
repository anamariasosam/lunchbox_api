class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.string :location
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
