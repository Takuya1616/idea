class CreateManagementSquares < ActiveRecord::Migration[6.1]
  def change
    create_table :management_squares do |t|
      t.integer :user_id
      t.integer :square_id
      t.integer :parent_square_id
      
      t.timestamps
    end
  end
end
