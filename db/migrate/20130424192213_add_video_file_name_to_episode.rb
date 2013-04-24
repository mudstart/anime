class AddVideoFileNameToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :video_file, :string
  end
end
