class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.text :description
      t.references :user
      t.timestamps
    end
  end
end
