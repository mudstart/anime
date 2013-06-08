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
  has_many :subscriptions, :dependent => :destroy
  has_many :shows_subscribed_to, :through => :subscriptions, :source => :anime_show

  def unseen_episodes

  end

end
