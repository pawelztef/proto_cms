# == Schema Information
#
# Table name: publishable_groups
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  icon        :string(255)
#  name        :string(255)
#  permalink   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PublishableGroup < ApplicationRecord
  has_many :publishables
end
