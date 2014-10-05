class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :owner_id
      t.string :title,       null: false
      t.text :description

      t.timestamps
    end

    add_index :problems, :owner_id
  end
end
