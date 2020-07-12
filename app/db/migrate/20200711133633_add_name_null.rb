class AddNameNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name,false, 0
    change_column :users, :name, :string, default: ""
  end
end
