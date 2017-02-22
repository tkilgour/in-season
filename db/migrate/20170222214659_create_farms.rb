class CreateFarms < ActiveRecord::Migration[5.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :farmers
      t.string :photo

      t.timestamps
    end
  end
end
