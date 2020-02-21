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
end
