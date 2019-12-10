class CreatePublishables < ActiveRecord::Migration[5.2]
  def change
    create_table :publishables do |t|
      t.string :title
      t.string :permalink
      t.string :type
      t.text :content
      t.text :summary
      t.integer :status, default: 0
      t.boolean :commentable, default: false
      t.integer :max_comment_nesting, default: 1

      t.references :site, foreign_key: true
      t.timestamps
    end
    add_index :publishables, :permalink
    add_index :publishables, :status
  end
end