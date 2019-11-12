class UpdateUsers < ActiveRecord::Migration[5.2]
    def change
      add_column :users, :name, :string, limit: 20, null: false, unique: true, default: ''
      add_column :users, :provider, :string, limit: 50, null: false, default: ''
      add_column :users, :uid, :string, limit: 500, null: false, default: ''
    end
end
