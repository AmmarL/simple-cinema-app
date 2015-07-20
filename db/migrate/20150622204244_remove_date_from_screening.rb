class RemoveDateFromScreening < ActiveRecord::Migration
  def change
    remove_column :screenings, :date, :date
    remove_column :screenings, :time, :time
    add_column :screenings, :start_datetime, :datetime
  end
end
