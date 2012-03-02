[Provider].each do |c|
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  list[c.to_s.tableize.to_sym].each do |r|
    c.create do |t|
      r.each do |i, v|
        t.send "#{i}=", v
      end
    end
  end
end
