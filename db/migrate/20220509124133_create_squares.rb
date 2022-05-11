class CreateSquares < ActiveRecord::Migration[6.1]
  def change
    create_table :squares do |t|
      t.string :row_1     
      t.string :row_2      
      t.string :row_3      
      t.string :row_4      
      t.string :row_5      
      t.string :row_6      
      t.string :row_7      
      t.string :row_8      
      t.string :row_9      

      t.timestamps
    end
  end
end
