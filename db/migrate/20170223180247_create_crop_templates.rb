class CreateCropTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :crop_templates do |t|
      t.string :name
      t.text :en_wikipedia_url
      t.integer :growstuff_id

      t.timestamps
    end
  end
end
