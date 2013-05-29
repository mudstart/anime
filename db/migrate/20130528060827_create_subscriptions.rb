class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.references :anime_show
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :anime_show_id
  end
end
