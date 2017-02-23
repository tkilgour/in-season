class ChangeTableNameToStockCrops < ActiveRecord::Migration[5.0]
    def change
      rename_table :crop_templates, :stock_crops
    end
end
