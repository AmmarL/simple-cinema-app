class MoviesController < ApplicationController
    skip_before_filter :verify_authenticity_token

  def index
  	@movies = if params[:keywords]
  				 Movie.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def create    
    @movie = Movie.new(params.require(:movie).permit(:name,:description ,:duration))
    @movie.save
    render 'show', status: 201
  end

  def update
    movie = Movie.find(params[:id])
    movie.update_attributes(params.require(:movie).permit(:name,:description,:duration))
    head :no_content
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    head :no_content
  end

end
