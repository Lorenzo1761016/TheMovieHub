class FilmController < ApplicationController
  def index
  end
  def search 
    @movies = Tmdb::Search.movie(params[:query])
    @res = @movies.results

  end
end