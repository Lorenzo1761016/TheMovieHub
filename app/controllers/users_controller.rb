class UsersController < ApplicationController
  before_action :require_admin
 

  def index
    @users = User.all
  end
  def show
  end

  private
  def require_admin
  unless current_user
    flash[:error] =  "DEVI ESSERE ADMIN"
      redirect_to new_user_session_path # halts request cycle
    end
  end
end
