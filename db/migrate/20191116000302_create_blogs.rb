class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :name
      t.boolean :visible, default: false
      t.string :permalink
      t.boolean :commentable, default: false
      t.integer :max_comment_nesting, default: 1
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
