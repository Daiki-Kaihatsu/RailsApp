class AddProfileNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :profile,false, 0
    change_column :users, :profile, :string, default: ""
  end
end
