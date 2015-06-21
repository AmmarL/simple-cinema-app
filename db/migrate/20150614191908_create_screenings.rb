class CreateScreenings < ActiveRecord::Migration
  def change
    create_table :screenings do |t|
      t.time :time
      t.date :date
      t.integer :duration
      t.references :movie, index: true
      t.references :room, index: true

      t.timestamps null: false
    end
    add_foreign_key :screenings, :movies
    add_foreign_key :screenings, :rooms
  end
end
