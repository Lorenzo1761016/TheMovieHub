class UsersController < ApplicationController
  attr_accessor :current_password 
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
    @user.update(mod: true);
    redirect_back fallback_location: root_path, notice: "Utente '"+@user.username+"' promosso"
    ahoy.track "Utente '"+@user.username+"' promosso", language: "Ruby"
  end

  def minus
    @user = User.find(params[:id])
    @user.update(mod: false);
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
  unless current_user
    flash[:error] =  "YOU MUST BE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end
end
