class AddDefaultImageToCrops < ActiveRecord::Migration[5.0]
  def change
    add_column :crops, :default_image, :string
  end
end
