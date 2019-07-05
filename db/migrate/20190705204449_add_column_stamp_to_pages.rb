class AddColumnStampToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :stamp, :string, null: false
  end
end
