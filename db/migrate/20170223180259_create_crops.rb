class CreateCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :crops do |t|
      t.integer :farm_id
      t.string :name
      t.text :image
      t.text :description
      t.date :harvest_date
      t.boolean :availability

      t.timestamps
    end
  end
end
