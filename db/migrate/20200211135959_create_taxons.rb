class CreateTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :taxons do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.string :type

      t.timestamps
    end
  end
end
