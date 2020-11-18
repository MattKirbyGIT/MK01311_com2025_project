class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :showing, foreign_key: true
      t.string :name
      t.string :email
      t.integer :seat
      t.integer :row
      t.string :E_ticket

      t.timestamps
    end
  end
end
