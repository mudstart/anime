class AddDescriptionToShow < ActiveRecord::Migration
  def change
    add_column :shows, :description, :text
  end
end
