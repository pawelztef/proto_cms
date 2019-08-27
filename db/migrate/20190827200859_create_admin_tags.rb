class CreateAdminTags < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
