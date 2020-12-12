class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    # Creates a venues table
    create_table :venues do |t|
      # All fields not null.
      t.string :name, null: false
      t.string :location, null: false
      t.string :image_url, null: false
      t.integer :rows, null: false
      t.integer :seats_per_row, null: false

      t.timestamps
    end
  end
end
