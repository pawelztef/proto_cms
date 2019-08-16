class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :second_name
      t.integer :role, default: 0
      t.index :role
      t.timestamps
    end
  end
end
