class RoomsController < ApplicationController

	def index
		@rooms = Rooms.all()
	end
end
