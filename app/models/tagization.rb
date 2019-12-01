# == Schema Information
#
# Table name: tagizations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :integer
#  tag_id     :integer
#

class Tagization < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end
