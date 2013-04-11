class Episode < ActiveRecord::Base
  belongs_to :anime_show
  attr_accessible :name, :number, :url

  validates :name, :number, :url, :anime_show_id, :presence => true
  validates :number, :uniqueness => { :scope => :anime_show_id }
end
