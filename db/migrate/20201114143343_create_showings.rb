class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :showings do |t|
      t.belongs_to :film, index: true, foreign_key: true, null: false
      t.string :venue, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.integer :rows, null: false
      t.integer :seats_per_row, null: false

      t.timestamps
    end
  end
end
