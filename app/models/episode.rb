class Episode < ActiveRecord::Base
  belongs_to :show
  attr_accessible :name, :number, :url

  validates :name, :number, :url, :presence => true
  validates :number, :uniqueness => true
end
