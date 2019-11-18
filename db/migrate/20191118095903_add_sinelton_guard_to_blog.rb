class AddSineltonGuardToBlog < ActiveRecord::Migration[5.2]
  def up 
    add_column :blogs, :singelton_guard, :integer, default: 0, unique: true
  end
  def down
    remove_column :blogs, :singelton_guard
  end
end
