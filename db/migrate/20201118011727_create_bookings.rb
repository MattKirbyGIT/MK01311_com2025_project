class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    # Create a booking table
    create_table :bookings do |t|
      # Showing must not be null and is foreign key
      t.belongs_to :showing, foreign_key: true, null: false
      # All other fields not null
      t.string :name, null: false
      t.string :email, null: false
      t.integer :seat, null: false
      t.integer :row, null: false
      t.string :E_ticket, null: false

      t.timestamps
    end
  end
end
