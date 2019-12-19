class CreatePublishableGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :publishable_groups do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
