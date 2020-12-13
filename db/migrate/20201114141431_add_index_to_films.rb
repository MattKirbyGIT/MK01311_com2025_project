class AddIndexToFilms < ActiveRecord::Migration[5.2]
  # adds unique index to films
  def change
    add_index :films, :title, unique: true, null: false
  end
end
