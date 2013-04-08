class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :show
      t.string :name
      t.text :url
      t.integer :number

      t.timestamps
    end
    add_index :episodes, :show_id
  end
end
