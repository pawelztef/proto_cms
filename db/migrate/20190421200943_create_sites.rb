class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :company_name
      t.string :catch_phrase

      t.timestamps
    end
  end
end
