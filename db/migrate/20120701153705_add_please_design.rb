class AddPleaseDesign < ActiveRecord::Migration
  def change
    add_column :sites, :please_design, :boolean
  end
end
