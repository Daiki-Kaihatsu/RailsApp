class AddProfileBgIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_bg_id, :string
  end
end
