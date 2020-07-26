class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title,default: "", null: false
      t.string :image_id
      t.text :reason
      t.string :preparation
      t.text :onepoint

      t.timestamps
    end
  end
end
