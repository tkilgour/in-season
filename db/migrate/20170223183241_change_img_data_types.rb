class ChangeImgDataTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :crops, :image, :string
    change_column :farms, :profile_image, :string
    change_column :farms, :banner_image, :string
  end
end
