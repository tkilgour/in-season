class AddMarketDayToMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :market_day, :string
  end
end
