class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    # Creates showing table with index.
    create_table :showings, index: true do |t|
      # film and venue are foreign keys, cant be null.
      t.belongs_to :film, foreign_key: true, null: false
      t.belongs_to :venue, foreign_key: true, null: false
      # Date can be null, not required for purpose of simplicity.
      t.date :date
      t.time :time, null: false
      t.decimal :price, null: false

      t.timestamps
    end

  
  end
end
