class StaticPagesController < ApplicationController
  before_action :if_logged_in

  def if_logged_in
    if current_user != nil
      redirect_to '/index' # halts request cycle
    end
  end

  def home
    ahoy.track "Homepage", language: "Ruby"
  end

  def help
  end

  def about
  end

  def contact
  end

end
