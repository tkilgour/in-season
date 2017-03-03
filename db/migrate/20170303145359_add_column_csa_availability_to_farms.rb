class AddColumnCsaAvailabilityToFarms < ActiveRecord::Migration[5.0]
  def change
    add_column :farms, :csa_availability, :boolean
  end
end
