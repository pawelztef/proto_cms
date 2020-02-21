class CreateTaxonomies < ActiveRecord::Migration[5.2]
  def change
    create_table :taxonomies do |t|
      t.integer :publishable_id
      t.integer :taxon_id

      t.timestamps
    end
  end
end
