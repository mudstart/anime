class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.text :url
      t.string :name

      t.timestamps
    end
  end
end
