class CreateRatingIdeas < ActiveRecord::Migration
  def change
    create_table :rating_ideas do |t|
      t.integer :user_id
      t.integer :idea_id

      t.integer :impact
      t.integer :frequency

      t.timestamps
    end

    add_index :rating_ideas, :user_id
    add_index :rating_ideas, :idea_id
    add_index :rating_ideas, [:user_id, :idea_id], unique: true
  end
end
