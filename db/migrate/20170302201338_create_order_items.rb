class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :box_id
      t.integer :order_id
      t.integer :quantity
      t.integer :item_price_cents
      t.integer :total_price_cents
    end
  end
end
