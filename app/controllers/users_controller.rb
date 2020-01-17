class UsersController < ApplicationController
 
  def index
    ahoy.track "Users index", language: "Ruby"
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    ahoy.track "Profilo utente "+@user.username, language: "Ruby"

  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/", notice: "user eliminated"
    ahoy.track "Utente "+@user.username+" eliminato", language: "Ruby"
  end

  def ban
    @user = User.find(params[:id])
    @user.update(banned: true);
    redirect_to "/", notice: "user blocked"
    redirect_back fallback_location: root_path, notice: "utente bloccato"
  end

  def unban
    @user = User.find(params[:id])
    @user.update(banned: false);
    redirect_to "/", notice: "user unblocked"
    redirect_back fallback_location: root_path, notice: "utente sbloccato"
  end

  private
  
  def require_admin
  unless current_user
    flash[:error] =  "YOU MUST BE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end
end
