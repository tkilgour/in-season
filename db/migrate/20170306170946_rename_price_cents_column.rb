class RenamePriceCentsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :boxes, :price_cents, :price
    rename_column :orders, :total_price_cents, :total_price
    rename_column :order_items, :total_price_cents, :total_price
    rename_column :order_items, :item_price_cents, :item_price
  end
end
