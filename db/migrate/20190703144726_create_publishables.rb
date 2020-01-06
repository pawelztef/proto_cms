class CreatePublishables < ActiveRecord::Migration[5.2]
  def change
    create_table :publishables do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.text :summary
      t.integer :status, default: 0
      t.boolean :commentable, default: false

      t.references :site, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :publishables, :permalink
    add_index :publishables, :status
  end
end
