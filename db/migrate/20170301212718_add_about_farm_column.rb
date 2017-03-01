class AddAboutFarmColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :farms, :about_farm, :text
  end
end
