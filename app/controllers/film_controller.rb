class FilmController < ApplicationController
  def index
    @popular = Tmdb::Movie.popular
  end
  def search 
    @movies = Tmdb::Search.movie(params[:query])
    @res = @movies.results
  end
  def result
    @film = Tmdb::Movie.detail(params[:id])
    @cast = Tmdb::Movie.cast(params[:id])
    @video = Tmdb::Movie.videos(params[:id])
    @keywords = Tmdb::Movie.keywords(params[:id])
    @similar = Tmdb::Movie.similar(params[:id])


  end
end