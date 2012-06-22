class InsertDefaultProvider < ActiveRecord::Migration
  def up
    Provider.create do|p|
      p.id = 1
      p.name = 'facebook'
    end
    Provider.create do|p|
      p.id = 2
      p.name = 'twitter'
    end
  end

  def down
    Provider.where(:id => [1, 2]).delete_all
  end
end
