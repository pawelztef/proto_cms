class AddPermissableToPermissions < ActiveRecord::Migration[5.2]
  def change
    add_reference :permissions, :permissable, polymorphic: true, index: true
  end
end
