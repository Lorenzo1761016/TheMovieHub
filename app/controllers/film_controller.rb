class FilmController < ApplicationController
  before_action :require_login
 
 
  def require_login
    unless current_user != nil
    flash[:error] =  "DEVI EFFETTUARE L'ACCESSO PER VISUALIZZARE I FILM"
      redirect_to new_user_session_path # halts request cycle
    end
  end


  def index
    @popular_films = Tmdb::Movie.popular
    @popular_series = Tmdb::TV.popular
  end
  def search 
    @people = Tmdb::Search.person(params[:query])
    @movies = Tmdb::Search.movie(params[:query])
    @series = Tmdb::Search.tv(params[:query])
  end
  def result
    if Film.exists?(params[:id])
      # your truck exists in the database
      @found = Film.find(params[:id])
    else
      # the truck doesn't exist
      n = Film.all.size
      @new_film = Film.new
      @new_film.id = params[:id]
      @new_film.save
      Film.all.size == n+1
      Film.all.each do |f|
        puts(f.id)
      @found = Film.find(params[:id])
     end

    end
    @film = Tmdb::Movie.detail(params[:id])
    @cast = Tmdb::Movie.cast(params[:id])
    @video = Tmdb::Movie.videos(params[:id])
    @keywords = Tmdb::Movie.keywords(params[:id])
    @similar = Tmdb::Movie.similar(params[:id])
    @directors = Tmdb::Movie.director(params[:id])
  end
  def tv
    if Tv.exists?(params[:id])
      # your truck exists in the database
      @ftv = Tv.find(params[:id])
    else
      # the truck doesn't exist
      n = Tv.all.size
      @new_tv = Tv.new
      @new_tv.id = params[:id]
      @new_tv.save
      Tv.all.size == n+1
      Tv.all.each do |f|
        puts(f.id)
      @ftv = Tv.find(params[:id])
     end
    end
    @serie = Tmdb::TV.detail(params[:id])
    @cast = Tmdb::TV.cast(params[:id])
    @ratings = Tmdb::TV.content_ratings(params[:id])
    @keywords = Tmdb::TV.keywords(params[:id])
    @videos = Tmdb::TV.videos(params[:id])
    @similar = Tmdb::TV.similar(params[:id])

  end
  def persona
    @persona = Tmdb::Person.detail(params[:id])
    @mc = Tmdb::Person.movie_credits(params[:id])
  end
end