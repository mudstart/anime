class User < ActiveRecord::Base

  if Rails.env.production?
    devise :database_authenticatable,
      :recoverable, :rememberable, :trackable, :validatable
  else
    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable
  end

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_seen_episodes, :dependent => :destroy
  has_many :seen_episodes, :through => :user_seen_episodes, :source => :episode

  has_many :subscriptions, :dependent => :destroy
  has_many :shows_subscribed_to, :through => :subscriptions, :source => :anime_show

  has_many :anime_show_episodes, :through => :shows_subscribed_to, :source => :episodes

  def unseen_anime_show_episodes
    anime_show_episodes.where("episodes.id NOT IN (?)", unseen_episode_ids)
  end

  private

  # work around for NOT IN (NULL) bug for empty array
  def unseen_episode_ids
    if seen_episode_ids.empty?
      ['']
    else
      seen_episode_ids
    end
  end

end
