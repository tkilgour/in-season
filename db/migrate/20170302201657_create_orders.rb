class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :farm_id
      t.integer :user_id
      t.integer :total_price_cents
      t.string :shipping_address
      t.string :stripe_charge_id
      t.string :status
    end
  end
end
