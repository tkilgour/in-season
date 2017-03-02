class AddIndexOrderItemsOnOrderId < ActiveRecord::Migration[5.0]
  def change
    add_index :order_items, :order_id
    add_index :order_items, :box_id
    add_index :orders, :user_id
    add_index :orders, :farm_id
    add_index :boxes, :farm_id
  end
end
