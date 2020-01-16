class UsersController < ApplicationController
 
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back fallback_location: root_path, notice: "utente eliminato"
  end

  def ban
    @user = User.find(params[:id])
    @user.update(banned: true);
    redirect_back fallback_location: root_path, notice: "utente bloccato"
  end

  def unban
    @user = User.find(params[:id])
    @user.update(banned: false);
    redirect_back fallback_location: root_path, notice: "utente sbloccato"
  end

  private
  
  def require_admin
  unless current_user
    flash[:error] =  "DEVI ESSERE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end
end
