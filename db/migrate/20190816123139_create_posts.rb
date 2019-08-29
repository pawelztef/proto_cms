class CreatePosts< ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.text :summary
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :posts, :permalink
  end
end
