class AddSingeltonGuardToSettings < ActiveRecord::Migration[5.2]
  def up
    add_column :settings, :singleton_guard, :integer, default: 0, unique: true
  end
  def down
    remove_column :settings, :singleton_guard
  end
end
