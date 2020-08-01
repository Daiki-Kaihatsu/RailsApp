class RenameImageIdColumnToBoardDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :board_details, :image_id, :image_detail_id
  end
end
