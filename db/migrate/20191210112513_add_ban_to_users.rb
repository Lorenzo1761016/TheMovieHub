class AddBanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banned, :boolean, default: false
    add_column :users, :bio, :string, limit: 500, default: ' '
  end
end
