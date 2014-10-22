class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :owner_id
      t.string :title,       null: false
      t.text :description
      t.string :file
      t.integer :row_order
      t.string :type

      t.timestamps
    end

    add_index :ideas, :owner_id
  end
end
