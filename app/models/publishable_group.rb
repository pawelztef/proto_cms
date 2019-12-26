# == Schema Information
#
# Table name: publishable_groups
#
#  id                  :bigint           not null, primary key
#  commentable         :boolean          default(FALSE)
#  description         :text(65535)
#  icon                :string(255)
#  max_comment_nesting :integer          default(1)
#  name                :string(255)
#  permalink           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  site_id             :bigint
#
# Indexes
#
#  index_publishable_groups_on_site_id  (site_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#

class PublishableGroup < ApplicationRecord
  has_many :publishables
  belongs_to :site
  
  validates_presence_of :name, :permalink
  validates_uniqueness_of :name, :permalink

  def volume
    self.publishables.count
  end

  def to_param
    permalink
  end
end
