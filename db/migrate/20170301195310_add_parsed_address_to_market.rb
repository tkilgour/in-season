class AddParsedAddressToMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :parsed_address, :string
  end
end
