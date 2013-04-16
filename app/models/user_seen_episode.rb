class UserSeenEpisode < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode
  attr_accessible :episode_id, :user_id
  validates :episode_id, :uniqueness => { :scope => :user_id }
end
