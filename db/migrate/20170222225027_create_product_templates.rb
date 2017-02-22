class CreateProductTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :product_templates do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
