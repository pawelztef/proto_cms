class AddImageTitileToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :title, :string, unique: true, null: false
  end
end
