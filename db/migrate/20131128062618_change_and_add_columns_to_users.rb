class ChangeAndAddColumnsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: true
    change_column :users, :default_provider_id, :string, null: true
    add_column :users, :default_provider, :string
    add_column :users, :locale, :string
    add_column :users, :content, :text
  end
end
