class Episode < ActiveRecord::Base
  belongs_to :anime_show
  attr_accessible :name, :number, :url, :image_url

  validates :name, :number, :url, :anime_show_id, :presence => true
  validates :number, :uniqueness => { :scope => :anime_show_id }

  scope :unseen_episodes, lambda { |user| where("episodes.id NOT IN (?)", user.user_seen_episodes.select(:episode_id).map(&:episode_id)) }
end
