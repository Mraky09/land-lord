class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
