class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :showing, foreign_key: true, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.integer :seat, null: false
      t.integer :row, null: false
      t.string :E_ticket, null: false

      t.timestamps
    end
  end
end
