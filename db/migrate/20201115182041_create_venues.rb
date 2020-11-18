class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.integer :rows
      t.integer :seats_per_row

      t.timestamps
    end
  end
end
