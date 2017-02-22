class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :farm_id
      t.string :name
      t.string :image
      t.date :harvest_date
      t.boolean :availability

      t.timestamps
    end
  end
end
