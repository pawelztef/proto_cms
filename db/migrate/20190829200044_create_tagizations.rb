class CreateTagizations < ActiveRecord::Migration[5.2]
  def change
    create_table :tagizations do |t|
      t.integer :pulishable_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
