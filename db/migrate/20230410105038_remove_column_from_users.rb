class RemoveColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :remember_created_at, :string
    remove_column :users, :reset_password_sent_at, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :email, :string
    remove_column :users, :role, :string
    remove_column :users, :name, :string
  end
end
