class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :menu_item, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :quantity
      t.references :order_status, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
