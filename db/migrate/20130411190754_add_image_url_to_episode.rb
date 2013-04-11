class AddImageUrlToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :image_url, :text
  end
end
