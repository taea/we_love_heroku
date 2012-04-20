desc "This task is called by the Heroku scheduler add-on"
task :get_site => :environment do
  Site.where(:scheduled_access => TRUE).all.each do|site|
    puts site.url
    begin
      site.get_site
    rescue
    end
  end
end
