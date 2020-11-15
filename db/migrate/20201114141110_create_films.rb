class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :release_date, null: false
      t.integer :running_time_mins, null: false
      t.integer :minimum_age_restriction, null: false
      t.string :image_url, null: false
      t.decimal :rating, null: false

      t.timestamps
    end
  end
end
