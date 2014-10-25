class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :user_id
      t.integer :idea_id

      t.string :name

      t.timestamps
    end

    add_index :tags, :user_id
    add_index :tags, :idea_id
    add_index :tags, [:user_id, :idea_id], unique: true
  end
end
