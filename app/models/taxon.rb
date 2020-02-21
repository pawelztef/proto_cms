# == Schema Information
#
# Table name: taxons
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  name        :string(255)
#  slug        :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Taxon < ApplicationRecord
  has_many :taxonomies
  has_many :publishables, through: :taxonomies
end
