class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :item_name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :quantity
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
