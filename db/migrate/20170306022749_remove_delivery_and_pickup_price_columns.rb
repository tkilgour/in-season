class RemoveDeliveryAndPickupPriceColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :boxes, :pickup_price_cents
    remove_column :boxes, :delivery_price_cents
    add_column :boxes, :price_cents, :integer
  end
end
