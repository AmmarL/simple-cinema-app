class ScreeningsController < ApplicationController
  	def index
		@screenings = Screening.all().order(start_datetime: :desc)
	end

	def show
		@screening = Screening.find(params[:id])
	end

	def create
    @screening = Screening.new(params.require(:screening).permit(:start_datetime ,:duration , :movie_id , :room_id))
    @screening.save
    render 'show', status: 201
  end

  def update
    screening = Screening.find(params[:id])
    screening.update_attributes(params.require(:screening).permit(:start_datetime ,:duration , :movie_id , :room_id))
    head :no_content
  end

  def destroy
    screening = Screening.find(params[:id])
    screening.destroy
    head :no_content
  end


end
