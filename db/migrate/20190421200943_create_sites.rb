class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :company_name
      t.string :catch_phrase
      t.integer :home_page_id
      t.integer :singleton_guard, default: 0, unique: true

      t.timestamps
    end
  end
end
