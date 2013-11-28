class RenameProvidersUsers < ActiveRecord::Migration
  def change
    rename_table :providers_users, :connections
  end
end
