desc "Updated all the episodes for shows"

task :update_all_episodes => :environment do
	AnimeShow.all.each do |show|
    Scrape.update_show(show.url) 
  end
end