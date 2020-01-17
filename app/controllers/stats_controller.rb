class StatsController < ApplicationController
  before_action :require_admin
 
  def stats
    ahoy.track "Stats", language: "Ruby"
    @users = User.all
    puts ("visite: ")
    @count =  Ahoy::Visit.count
    @event_count  = Ahoy::Event.count
    @events  = Ahoy::Event.all

  end

  private
  
  def require_admin
  unless current_user
    flash[:error] =  "DEVI ESSERE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end

end
