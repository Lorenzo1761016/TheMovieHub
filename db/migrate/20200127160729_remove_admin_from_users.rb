class RemoveAdminFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :mod, :string

    remove_column :users, :admin, :string
  end
end
