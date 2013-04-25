class Episode < ActiveRecord::Base
  after_create :download_episode

  belongs_to :anime_show
  attr_accessible :name, :number, :url, :image_url, :video_file

  validates :name, :number, :url, :anime_show_id, :presence => true
  validates :number, :uniqueness => { :scope => :anime_show_id }

  scope :unseen_episodes, lambda { |user| where("episodes.id NOT IN (?)", user.user_seen_episodes.select(:episode_id).map(&:episode_id)) }

  private

  def download_episode
    GetMp4.delay(:run_at => Time.zone.now).get_video(self)
  end
end
