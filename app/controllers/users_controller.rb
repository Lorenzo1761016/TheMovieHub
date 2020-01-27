class UsersController < ApplicationController
  before_action :require_admin, :only => [:destroy]
  before_action :require_ad_mod, :only => [:index]
  before_action :require_ger, :only => [:ban, :unban, :plus, :minus]
  before_action :require_current, :only => [:favdestroy]

  def index
    ahoy.track "Users index", language: "Ruby"
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    puts("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIi")
    puts("IMG: "+@user.providerimg)
    ahoy.track "Profilo utente '"+@user.username+"'", language: "Ruby"

  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back fallback_location: root_path, notice: "Utente '"+@user.username+"' eliminato"
    ahoy.track "Utente '"+@user.username+"' eliminato", language: "Ruby"
  end

  def ban
    @user = User.find(params[:id])
    @user.update(banned: true);
    redirect_back fallback_location: root_path, notice: "Utente '"+@user.username+"' sospeso"
    ahoy.track "Utente '"+@user.username+"' sospeso", language: "Ruby"

  end

  def unban
    @user = User.find(params[:id])
    @user.update(banned: false);
    redirect_back fallback_location: root_path, notice: "Utente '"+@user.username+"' sbloccato"
    ahoy.track "Utente '"+@user.username+"' sbloccato", language: "Ruby"

  end

  def plus
    @user = User.find(params[:id])
    @user.update(role: "M");
    redirect_back fallback_location: root_path, notice: "Utente '"+@user.username+"' promosso"
    ahoy.track "Utente '"+@user.username+"' promosso", language: "Ruby"
  end

  def minus
    @user = User.find(params[:id])
    @user.update(role: "U");
    redirect_back fallback_location: root_path, notice: "Utente '"+@user.username+"' retrocesso"
    ahoy.track "Utente '"+@user.username+"' retrocesso", language: "Ruby"
  end

  def favorites
    @favs = Favorite.all
    @id = params[:id]
    puts("ID: "+@id)
  end

  def favdestroy
    f = Favorite.find(params[:fav])
    ahoy.track f.name+" Rimosso dai Preferiti"
    f.destroy
    redirect_back fallback_location: root_path, notice: "Elemento rimosso dai preferiti"
  end


  private
  
  def require_admin
  unless current_user.role == "A"
    flash[:alert] =  "Accesso Negato"
      redirect_back fallback_location: root_path # halts request cycle
    end
  end
  
  def require_ad_mod
    unless current_user.role == "A" || current_user.role == "M"
      flash[:alert] =  "Accesso Negato"
        redirect_to root_path # halts request cycle
    end
  end

  def require_ger
    unless (current_user.role == "A" && (User.find(params[:id]).role == "M" || User.find(params[:id]).role == "U")) || (current_user.role == "M" && User.find(params[:id]).role == "U")
      flash[:alert] =  "Accesso Negato"
        redirect_to root_path # halts request cycle
    end
  end
  
  def require_current
    unless current_user.id == Favorite.find(params[:fav]).user_id
        redirect_back fallback_location: root_path, alert: "Accesso Negato" # halts request cycle
    end
  end
end
