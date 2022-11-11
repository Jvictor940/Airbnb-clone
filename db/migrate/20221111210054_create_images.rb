class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :home_id
      t.string :home_type
      t.string :img

      t.timestamps
    end
  end
end
