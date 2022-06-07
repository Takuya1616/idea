class AddScoreToParentSquares < ActiveRecord::Migration[6.1]
  def change
    add_column :parent_squares, :score, :decimal, precision: 5, scale: 3
  end
end
