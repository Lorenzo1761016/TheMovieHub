class AddBanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banned, :boolean, default: false
    add_column :users, :bio, :string, limit: 500, default: ' '
    add_column :users, :font_image, :string, default: '#ccc'
    add_column :users, :providerimg, :string, default: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
  end
end
