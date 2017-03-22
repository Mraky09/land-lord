class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.string :address
      t.text :description
      t.integer :no_bed_room
      t.integer :no_bath_room
      t.integer :status
      t.integer :house_type
      t.float :area
      t.float :price

      t.references :user
      t.references :country
      t.references :city
      t.references :district

      t.timestamps
    end
  end
end
