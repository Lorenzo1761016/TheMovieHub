class FilmController < ApplicationController
  def index
  end
  def search 
    @movies = Tmdb::Search.movie(params[:query])
    @res = @movies.results
  end
  def result
    @film = Tmdb::Movie.detail(params[:id])
  end
end