class AddAncestryToPublishables < ActiveRecord::Migration[5.2]
  def change
    add_column :publishables, :ancestry, :string
    add_index :publishables, :ancestry
  end
end
