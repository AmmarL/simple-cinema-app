class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.integer :row
      t.references :theater, index: true

      t.timestamps null: false
    end
    add_foreign_key :rooms, :theaters
  end
end
