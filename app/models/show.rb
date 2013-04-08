class Show < ActiveRecord::Base
  attr_accessible :name, :url
  validates :name, :url, :presence => true

  has_many :episodes, :dependent => :destroy
end
