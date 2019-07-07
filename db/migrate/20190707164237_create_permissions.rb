class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.integer :name, default: 0
      t.index :name, unique: true
      t.timestamps
    end
  end
end
