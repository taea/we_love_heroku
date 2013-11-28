# heroku run rails runner ./bin/maintenance/renewal.rb
ActiveRecord::Base.transaction do
  puts "----------------------------------------------------"
  puts " Update connections.provider"
  puts "----------------------------------------------------"
  all_connections = Connection.all
  fb_connections = Connection.where(provider_id: 1)
  tw_connections = Connection.where(provider_id: 2)
  gh_connections = Connection.where(provider_id: 3)

  puts 'All connections'
  puts all_connections.count
  puts 'Fb connections'
  puts fb_connections.count
  puts 'Tw connections'
  puts tw_connections.count
  puts 'Gh connections'
  puts gh_connections.count
  puts 'group by provider'
  puts Connection.group(:provider).count

  print 'wait'
  fb_connections.each do |connection|
    connection.update_column(:provider, 'facebook')
  end
  tw_connections.each do |connection|
    connection.update_column(:provider, 'twitter')
  end
  gh_connections.each do |connection|
    connection.update_column(:provider, 'github')
  end

  puts 'group by provider'
  puts Connection.group(:provider).count

  print '...'
  puts 'ok'

  puts "----------------------------------------------------"
  puts " Update users.default_provider"
  puts "----------------------------------------------------"
  all_users = User.all
  fb_users = User.where(default_provider_id: '1')
  tw_users = User.where(default_provider_id: '2')
  gh_users = User.where(default_provider_id: '3')

  puts 'All users'
  puts all_users.count
  puts 'Fb users'
  puts fb_users.count
  puts 'Tw users'
  puts tw_users.count
  puts 'Gh users'
  puts gh_users.count
  puts 'group by provider'
  puts User.group(:default_provider).count

  print 'wait'
  fb_users.each do |user|
    user.update_column(:default_provider, 'facebook')
  end
  tw_users.each do |user|
    user.update_column(:default_provider, 'twitter')
  end
  gh_users.each do |user|
    user.update_column(:default_provider, 'github')
  end

  puts 'group by provider'
  puts User.group(:default_provider).count

  print '...'
  puts 'ok'

  puts 'Are you sure?(yes/no)'
  if gets.strip == 'yes'
    puts 'DONE'
  else
    puts 'ROLLBACKED'
    raise ActiveRecord::Rollback
  end
end
