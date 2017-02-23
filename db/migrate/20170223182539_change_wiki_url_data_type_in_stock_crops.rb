class ChangeWikiUrlDataTypeInStockCrops < ActiveRecord::Migration[5.0]
  def change
    change_column :stock_crops, :en_wikipedia_url, :string
  end
end
