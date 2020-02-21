# == Schema Information
#
# Table name: taxonomies
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  publishable_id :integer
#  taxon_id       :integer
#

class Taxonomy < ApplicationRecord
  belongs_to :publishable
  belongs_to :taxon
  belongs_to :category, class_name: "Taxon", foreign_key: "taxon_id"
  belongs_to :tag, class_name: "Taxon", foreign_key: "taxon_id"
end
