class AddNumberOfTicketsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :number_of_tickets, :integer
  end
end
