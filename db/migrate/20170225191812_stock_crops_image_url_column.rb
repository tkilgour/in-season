class StockCropsImageUrlColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :stock_crops, :image_url if StockCrop.column_names.include?('image_url')
    add_column :stock_crops, :image_url, :string
  end
end
