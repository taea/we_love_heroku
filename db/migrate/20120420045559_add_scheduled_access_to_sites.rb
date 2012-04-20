class AddScheduledAccessToSites < ActiveRecord::Migration
  def change
    add_column :sites, :scheduled_access, :boolean
  end
end
