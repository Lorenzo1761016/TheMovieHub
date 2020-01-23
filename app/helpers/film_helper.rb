module FilmHelper

    def is_fav
        favs = Favorite.all
        favs.each do |f|
          puts("UTENTE: "+f.user_id.to_s+"- NOME "+f.name+" - "+f.fav_type)
          if f.name == @film.title && f.user_id == current_user.id
            return true
          end
        end
        return false
    end
    

  
end
