module ApplicationHelper

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
      base_title = "Moviepedia"
      if page_title.empty?
        base_title
      else
        "#{base_title} | #{page_title}"
      end
    end

    def create_admin
      users = User.All
      count =  0
      users.each do |u|
        if u.role =="A"
          puts("Admin: "+u.username)
          count = count+1
        end
      end
      if count == 0
        u = User.new(email: "lorenzo.scarlino.98@gmail.com", first_name: "Lorenzo", last_name: "Admin", password: "oooooo", role: "A")
        u.save!
        puts( "Admin creato")
        return true
      else
        puts("Ci sono già Admin")
        return false
      end
    end
  end
