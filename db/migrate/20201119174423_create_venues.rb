class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :image_url
      t.integer :rows, null: false
      t.integer :seats_per_row, null: false

      t.timestamps
    end
  end
end
