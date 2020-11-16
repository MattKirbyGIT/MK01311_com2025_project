class CreateShowingsVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :showings_venues, id: false do |t|
      t.belongs_to :showing
      t.belongs_to :venue
    end
  end
end
