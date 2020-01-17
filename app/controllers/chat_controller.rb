class ChatController < ApplicationController
  before_action :require_login
 
  private
 
  def require_login
    unless current_user != nil
    flash[:error] =  "DEVI EFFETTUARE L'ACCESSO PER ACCEDERE ALLA CHAT"
      redirect_to new_user_session_path # halts request cycle
    end
  end
  def index
    ahoy.track "Chat", language: "Ruby"
  end
end
