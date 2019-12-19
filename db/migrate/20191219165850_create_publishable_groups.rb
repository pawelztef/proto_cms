class CreatePublishableGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :publishable_groups do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.boolean :commentable, default: false
      t.integer :max_comment_nesting, default: 1
      t.string :icon
      t.references :site, foreign_key: true
      t.timestamps
    end
  end
end
