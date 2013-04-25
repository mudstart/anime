desc "Updated all the episodes for shows"

task :update_all_episodes => :environment do
	AnimeShow.all.each do |show|
    Scrape.delay(:run_at => Time.zone.now).update_show(show)
  end
end