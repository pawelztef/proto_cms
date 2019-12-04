# == Schema Information
#
# Table name: publishables
#
#  id                  :bigint           not null, primary key
#  ancestry            :string(255)
#  commentable         :boolean          default(FALSE)
#  content             :text(65535)
#  max_comment_nesting :integer          default(1)
#  permalink           :string(255)
#  status              :integer          default(0)
#  summary             :text(65535)
#  title               :string(255)
#  type                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  site_id             :bigint
#
# Indexes
#
#  index_publishables_on_ancestry   (ancestry)
#  index_publishables_on_permalink  (permalink)
#  index_publishables_on_site_id    (site_id)
#  index_publishables_on_status     (status)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#

class Publishable < ApplicationRecord

  has_ancestry

  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :tagizations
  has_many :tags, :through => :tagizations
  belongs_to :site


  def to_param
    permalink
  end

  # TODO create method wich dynamicaly creates below methods according to existing subclasses.

  def home_page?
    self.type == "HomePage"
  end

  def blog?
    self.type == "Blog"
  end

  def post
    self.type == "Post"
  end


end


