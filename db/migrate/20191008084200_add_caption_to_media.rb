class AddCaptionToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :caption, :text
  end
end
