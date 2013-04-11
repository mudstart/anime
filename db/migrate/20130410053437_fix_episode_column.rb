class FixEpisodeColumn < ActiveRecord::Migration
def change
    rename_column :episodes, :show_id, :anime_show_id
  end
end
