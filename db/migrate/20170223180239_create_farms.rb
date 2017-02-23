class CreateFarms < ActiveRecord::Migration[5.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :farmer
      t.text :profile_image
      t.text :banner_image

      t.timestamps
    end
  end
end
