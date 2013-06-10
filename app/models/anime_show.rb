class AnimeShow < ActiveRecord::Base
  attr_accessible :name, :description, :url, :image_url
  validates :name, :url, :presence => true

  has_many :episodes, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy

  default_scope { order("anime_shows.updated_at DESC") }
end
