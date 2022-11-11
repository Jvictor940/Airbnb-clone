class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :home_id
      t.string :start_date
      t.string :end_date
      t.integer :price

      t.timestamps
    end
  end
end
