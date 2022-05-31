class CreateCotacts < ActiveRecord::Migration[6.1]
  def change
    create_table :cotacts do |t|
      t.string :name, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
