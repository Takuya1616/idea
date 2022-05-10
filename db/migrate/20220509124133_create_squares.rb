class CreateSquares < ActiveRecord::Migration[6.1]
  def change
    create_table :squares do |t|
      t.integer :position
      t.integer :parent_square_id, null:false
      t.string :idea

      t.timestamps
    end
  end
end
