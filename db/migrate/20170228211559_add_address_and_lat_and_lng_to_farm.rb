class AddAddressAndLatAndLngToFarm < ActiveRecord::Migration[5.0]
  def change
    add_column :farms, :address, :string
    add_column :farms, :lat, :float
    add_column :farms, :lng, :float
  end
end
