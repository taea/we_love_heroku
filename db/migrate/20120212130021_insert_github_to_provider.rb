class InsertGithubToProvider < ActiveRecord::Migration
  def up
    Provider.create do|p|
      p.id = 3
      p.name = 'github'
    end
  end

  def down
    Provider.where(:id => [3]).delete_all
  end
end
