class ChangeParentsToCaregivers < ActiveRecord::Migration[5.2]
  def change
    rename_table :parents, :caregivers
  end
end
