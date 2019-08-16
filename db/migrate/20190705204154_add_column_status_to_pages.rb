class AddColumnStatusToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :status, :integer, default: 0
    add_index :pages, :status
  end
end
