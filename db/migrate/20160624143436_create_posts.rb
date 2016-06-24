class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :team
      t.integer :user_id
      t.integer :question_id

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end
