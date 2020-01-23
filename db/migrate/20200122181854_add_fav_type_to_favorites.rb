class AddFavTypeToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :fav_type, :string
  end
end
