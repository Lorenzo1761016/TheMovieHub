class AddCountToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :visits, :integer, default: 1
  end
end
