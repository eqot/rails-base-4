class CreateLikeIdeas < ActiveRecord::Migration
  def change
    create_table :like_ideas do |t|
      t.integer :user_id
      t.integer :idea_id

      t.timestamps
    end

    add_index :like_ideas, :user_id
    add_index :like_ideas, :idea_id
    add_index :like_ideas, [:user_id, :idea_id], unique: true
  end
end
