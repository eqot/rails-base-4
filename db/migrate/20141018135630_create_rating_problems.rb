class CreateRatingProblems < ActiveRecord::Migration
  def change
    create_table :rating_problems do |t|
      t.integer :user_id
      t.integer :problem_id

      t.integer :impact
      t.integer :frequency

      t.timestamps
    end

    add_index :rating_problems, :user_id
    add_index :rating_problems, :problem_id
    add_index :rating_problems, [:user_id, :problem_id], unique: true
  end
end
