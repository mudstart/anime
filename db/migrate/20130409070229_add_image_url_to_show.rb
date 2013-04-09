class AddImageUrlToShow < ActiveRecord::Migration
  def change
    add_column :shows, :image_url, :text
  end
end
