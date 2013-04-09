class CreateUserSeenEpisodes < ActiveRecord::Migration
  def change
    create_table :user_seen_episodes do |t|
      t.references :user
      t.references :episode

      t.timestamps
    end
    add_index :user_seen_episodes, :user_id
    add_index :user_seen_episodes, :episode_id
  end
end
