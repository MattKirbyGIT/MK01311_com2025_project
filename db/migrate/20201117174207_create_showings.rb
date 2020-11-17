class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :showings do |t|
      t.belongs_to :film, foreign_key: true, null: false
      t.belongs_to :venue, foreign_key: true, null: false
      t.date :date
      t.time :time, null: false

      t.timestamps
    end
  end
end
