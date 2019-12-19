class AddPublishableGroupToPublishable < ActiveRecord::Migration[5.2]
  def change
    add_reference :publishables, :publishable_group, foreign_key: true
  end
end
