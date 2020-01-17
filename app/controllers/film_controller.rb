class FilmController < ApplicationController
  before_action :require_login
 
 
  def require_login
    unless current_user != nil
    flash[:error] =  "DEVI EFFETTUARE L'ACCESSO PER VISUALIZZARE I FILM"
      redirect_to new_user_session_path # halts request cycle
    end
  end


  def index
    ahoy.track "Index", language: "Ruby"
    @popular_films = Tmdb::Movie.popular
    @popular_series = Tmdb::TV.popular
    @popular_people = Tmdb::Person.popular
  end

  def search 
    @search = Tmdb::Search.multi(params[:query])
    ahoy.track "Search "+params[:query], language: "Ruby"
  end

  def result
    ahoy.track "Film: "+Tmdb::Movie.detail(params[:id]).title ,language: "Ruby"
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
    @poster_path = @film.poster_path ? 'https://image.tmdb.org/t/p/original/'+@film.poster_path : "/no_locandina.webp";
    if @film.belongs_to_collection
      @collection = Tmdb::Collection.detail(@film.belongs_to_collection.id);
    end
  end

  def tv
    ahoy.track "Serie TV: "+Tmdb::TV.detail(params[:id]).name ,language: "Ruby"
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
    @poster_path = @serie.poster_path ? 'https://image.tmdb.org/t/p/original/'+@serie.poster_path : "/no_locandina.webp"
  end

  def season
    @season = Tmdb::Tv::Season.detail(params[:id],params[:number])
    @videos = Tmdb::Tv::Season.videos(params[:id],params[:number])
    @poster_path = @season.poster_path ? 'https://image.tmdb.org/t/p/original/'+@season.poster_path : "/no_locandina.webp";
    @serie = Tmdb::TV.detail(params[:id])
    ahoy.track "Serie TV:" + @serie.name + ", " + @season.name, language: "Ruby"
  end

  def persona
    @persona = Tmdb::Person.detail(params[:id])
    @mc = Tmdb::Person.combined_credits(params[:id])
    @profile_path = @persona.profile_path ? 'https://image.tmdb.org/t/p/original/'+@persona.profile_path : "/no_locandina.webp";
    ahoy.track "Persona "+ @persona.name
  end
end