class ChangeAndAndColumnsToConnections < ActiveRecord::Migration
  def change
    change_column :connections, :provider_id, :integer, null: true
    rename_column :connections, :secret, :secret_token
    rename_column :connections, :user_key, :uid
    add_column :connections, :provider, :string
    add_column :connections, :nickname, :string
  end
end
