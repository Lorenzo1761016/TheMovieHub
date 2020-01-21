class StatsController < ApplicationController
  before_action :require_admin
 
  def stats
    ahoy.track "Stats", language: "Ruby"
    @users = User.all
    puts ("visite: ")
    @count =  Ahoy::Visit.count
    @visits = Ahoy::Visit.all
    @event_count  = Ahoy::Event.count
    @events  = Ahoy::Event.all
    @film_count =  Ahoy::Event.select { |event| event.name['Film'] }.uniq.count
    @tv_count =  Ahoy::Event.select { |event| event.name['Serie TV'] }.uniq.count
    
    def top_film
      @films = Film.all
      count = 0
      film = "Nessuno"
      @films.each do |f|
        if f.visits > count
          count = f.visits
          film = Tmdb::Movie.detail(f.id).title
        end
      end
      return film
    end

    def top_film_count
      @films = Film.all
      count = 0
      film = "Nessuno"
      @films.each do |f|
        if f.visits > count
          count = f.visits
        end
      end
      return count
    end

    def top_film_id
      @films = Film.all
      count = 0
      film = "Nessuno"
      @films.each do |f|
        if f.visits > count
          count = f.visits
          film = Tmdb::Movie.detail(f.id).id
        end
      end
      return film
    end

   
       
    @top_film = top_film
    @top_film_count = top_film_count
    @top_film_id = top_film_id

    def top_tv
      @tvs = Tv.all
      count = 0
      tv = "Nessuno"
      @tvs.each do |t|
        if t.visits > count
          count = t.visits
          tv = Tmdb::TV.detail(t.id).name
        end
      end
      return tv
    end


    def top_tv_count
      @tvs = Tv.all
      count = 0
      tv = "Nessuno"
      @tvs.each do |t|
        if t.visits > count
          count = t.visits
        end
      end
      return count
    end
    

    def top_tv_id
      @tvs = Tv.all
      count = 0
      tv = "Nessuno"
      @tvs.each do |t|
        if t.visits > count
          count = t.visits
          tv = Tmdb::TV.detail(t.id).id
        end
      end
      return tv
    end

    @top_tv = top_tv
    @top_tv_count = top_tv_count
    @top_tv_id = top_tv_id

    def twitter_users
      @users = User.all
      count = 0
      @users.each do |u|
        if u.provider == "twitter"
          count = count+1
        end
      end
      return count
    end

    @twitter_users = twitter_users


  end

 
    

  private
  
  def require_admin
  unless current_user
    flash[:error] =  "DEVI ESSERE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end


end
