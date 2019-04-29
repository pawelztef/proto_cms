class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :company_name
      t.string :catch_phrase

      t.timestamps
    end
  end
end
