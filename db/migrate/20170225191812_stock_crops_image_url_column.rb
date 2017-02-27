class StockCropsImageUrlColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_crops, :image_url, :string
  end
end
