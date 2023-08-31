class AddWorkPreferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :work_preferences, :json
    add_column :users, :settings, :json
  end
end
