class TheatersController < ApplicationController
    def index
  	@theaters = Theater.all()
  end
end