class RenameShowsTable < ActiveRecord::Migration
  def self.up
    rename_table :shows, :anime_shows
  end

 def self.down
    rename_table :anime_shows, :shows
 end
end
