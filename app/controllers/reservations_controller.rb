class ReservationsController < ApplicationController
    def index
		@reservations = Reservation.all()
	end

	def show
		@reservation = Reservation.find(param[:id])
	end

	def create
    @reservation = Reservation.new(params.require(:reservation).permit(:screening_id,:user_id,:number_of_tickets))
    @reservation.save
    render 'show', status: 201
  end

  def update
    reservation = Reservation.find(params[:id])
    reservation.update_attributes(params.require(:reservation).permit(:screening , :user))
    head :no_content
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    head :no_content
  end
end
