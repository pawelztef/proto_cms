class CreateBlog < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.boolean :commentable
      t.integer :nesting
    end
  end
end
