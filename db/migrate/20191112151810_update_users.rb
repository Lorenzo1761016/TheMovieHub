class UpdateUsers < ActiveRecord::Migration[5.2]
    def change
      add_column :users, :username, :string, limit: 20, null: false, unique: true, default: ''
      add_column :users, :provider, :string, limit: 50, null: false, default: ''
      add_column :users, :uid, :string, limit: 500, null: false, default: ''
      add_column :users, :first_name, :string, limit: 20, null: false,  unique: true, default: ' '
      add_column :users, :last_name, :string, limit: 20, null: false,  unique: true, default: ' '
      add_column :users, :date_of_birth, :date
      add_column :users, :gender, :integer, default: '0'
      add_column :users, :phone_number, :integer, default: ''
      add_column :users, :twittername, :string, limit:20, null: false, default: ''
    end
end
