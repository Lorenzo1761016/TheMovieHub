class StaticPagesController < ApplicationController
  before_action :if_logged_in

  def if_logged_in
    if current_user != nil
      redirect_to '/index' # halts request cycle
    end
  end

  def home
    if create_admin
      puts("Admin creato!")
    end
    ahoy.track "Homepage", language: "Ruby"
  end

  def help
  end

  def about
  end

  def contact
  end

  private

  def create_admin
    users = User.all
    count =  0
    users.each do |u|
      if u.role =="A"
        puts("Admin: "+u.username)
        count = count+1
      end
    end
    if count == 0
      u = User.new(email: "lorenzo.scarlino.98@gmail.com", username: "LorenzoAdmin", first_name: "Lorenzo", last_name: "Admin", password: "oooooo", role: "A")
      u.save!
      puts( "Admin creato")
      return true
    else
      puts("Ci sono già Admin")
      return false
    end
  end

end
