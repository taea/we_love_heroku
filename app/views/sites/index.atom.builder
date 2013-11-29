atom_feed do |feed|
  feed.title "Title"
  feed.updated @sites.first.created_at

  @sites.each do |site|
    feed.entry site do |entry|
      entry.title site.name
      entry.content site.description, :type => 'html'

      entry.creator do |author|
        author.name site.creator
      end
    end
  end
end