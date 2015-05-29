class MoviesController < ApplicationController

  def index
  	@movies = if params[:keywords]
  				 Movie.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
end
