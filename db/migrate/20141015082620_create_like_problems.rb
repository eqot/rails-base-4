class CreateLikeProblems < ActiveRecord::Migration
  def change
    create_table :like_problems do |t|
      t.integer :user_id
      t.integer :problem_id

      t.timestamps
    end

    add_index :like_problems, :user_id
    add_index :like_problems, :problem_id
    add_index :like_problems, [:user_id, :problem_id], unique: true
  end
end
