class StatsController < ApplicationController
  before_action :require_admin
 
  def stats
    ahoy.track "Stats", language: "Ruby"
    @users = User.all
    puts ("visite: ")
    @count =  Ahoy::Visit.count
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
      return film+" - "+count.to_s+" visite"
    end
       
    @top_film = top_film

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
      return tv+" - "+count.to_s+" visite"
    end

    @top_tv = top_tv


  end

 
    

  private
  
  def require_admin
  unless current_user
    flash[:error] =  "DEVI ESSERE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end


end
