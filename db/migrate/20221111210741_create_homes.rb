class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.string :home_type
      t.integer :total_occupancy
      t.integer :total_bedrooms
      t.integer :total_bathrooms
      t.text :summary
      t.string :address
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_air_con
      t.boolean :has_internet
      t.integer :price
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
