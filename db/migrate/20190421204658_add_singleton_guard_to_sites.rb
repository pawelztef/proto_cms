class AddSingletonGuardToSites < ActiveRecord::Migration[5.2]
  def up
    add_column :sites, :singleton_guard, :integer, default: 0, unique: true
  end
  def down
    remove_column :sites, :singleton_guard
  end
end
