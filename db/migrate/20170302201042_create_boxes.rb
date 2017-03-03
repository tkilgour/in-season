class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.integer :farm_id
      t.string :size
      t.integer :pickup_price_cents
      t.integer :delivery_price_cents
      t.text :description
    end
  end
end
