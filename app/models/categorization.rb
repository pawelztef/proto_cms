# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  page_id     :integer
#

class Categorization < ApplicationRecord
  belongs_to :post
  belongs_to :category
end
