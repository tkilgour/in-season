class AddAddressToMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :address, :string
  end
end
