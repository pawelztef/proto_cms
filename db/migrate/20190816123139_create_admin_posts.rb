class CreateAdminPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_posts do |t|
      t.string :title
      t.text :content
      t.string :summary

      t.timestamps
    end
  end
end
