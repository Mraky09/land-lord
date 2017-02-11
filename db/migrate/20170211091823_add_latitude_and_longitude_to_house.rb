class AddLatitudeAndLongitudeToHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :latitude, :float
    add_column :houses, :longitude, :float
  end
end
