class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def up 
    add_column :users, :role_id, :integer
    add_index :users, :role_id
  end
  def down
    remove_index :users, :role_id
    remove_column :users, :role_id
  end
end
