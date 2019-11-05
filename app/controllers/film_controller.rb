class FilmController < ApplicationController
  def index
  end
  def search  
    @movies = Tmdb::Search.movie(params[:query])

    render json: @movies
  end
end