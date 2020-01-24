module FilmHelper

    def is_fav_film
        favs = Favorite.all
        favs.each do |f|
          puts("UTENTE: "+f.user_id.to_s+"- NOME "+f.name+" - "+f.fav_type)
          if f.fav_type == "Film" && f.fav_id == @film.id && f.user_id == current_user.id
            return true
          end
        end
        return false
    end
    
    def is_fav_tv
        favs = Favorite.all
        favs.each do |f|
          puts("UTENTE: "+f.user_id.to_s+"- NOME "+f.name+" - "+f.fav_type)
          if f.fav_type == "TV" && f.fav_id == @serie.id && f.user_id == current_user.id
            return true
          end
        end
        return false
    end

  
end
