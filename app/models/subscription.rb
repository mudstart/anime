class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :anime_show

  attr_accessible :anime_show_id
end
