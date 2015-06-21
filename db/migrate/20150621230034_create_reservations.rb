class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :screening, index: true

      t.timestamps null: false
    end
    add_foreign_key :reservations, :users
    add_foreign_key :reservations, :screenings
  end
end
