class AddImageUrlToShow < ActiveRecord::Migration
  def change
    add_column :anime_shows, :image_url, :text
  end
end
