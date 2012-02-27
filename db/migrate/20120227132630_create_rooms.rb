class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.text :description

      t.timestamps
    end
    add_index :rooms, :user_id, :name => :idx_user_id_rooms
  end
end
