class AnimeShow < ActiveRecord::Base
  attr_accessible :name, :description, :url, :image_url
  validates :name, :url, :presence => true

  has_many :episodes, :dependent => :destroy

  default_scope { order("updated_at DESC") }
end
