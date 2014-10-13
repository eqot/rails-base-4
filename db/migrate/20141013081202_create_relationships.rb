class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :relating_id
      t.integer :related_id

      t.timestamps
    end

    add_index :relationships, :relating_id
    add_index :relationships, :related_id
    add_index :relationships, [:relating_id, :related_id], unique: true
  end
end
