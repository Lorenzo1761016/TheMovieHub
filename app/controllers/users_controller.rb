class UsersController < ApplicationController
 
  def index
    ahoy.track "Users index", language: "Ruby"
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
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

  def favorites
    @favs = Favorite.all
  end

  def favdestroy
    f = Favorite.find(params[:id])
    ahoy.track f.fav_name+" Rimosso dai Preferiti"
    f.destroy
    redirect_back fallback_location: root_path, notice: "Elemento rimosso dai preferiti"
  end


  private
  
  def require_admin
  unless current_user
    flash[:error] =  "YOU MUST BE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end
end
