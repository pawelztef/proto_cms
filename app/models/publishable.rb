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
#  status              :integer          default("draft")
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


  validates_uniqueness_of :title, :permalink
  validates_presence_of :title, :permalink


  #TODO Eextract dynamic scopes based on statuses.

  enum status: PublishableStatus::STATUSES

  PageStatus::STATUSES.each do |s|
    scope s, -> { where(status: s) }
  end

  # TODO create method wich dynamicaly creates below methods according to existing subclasses.

  def is_home_page?
    self.type == "HomePage"
  end

  def is_blog?
    self.type == "Blog"
  end

  def is_post?
    self.type == "Post"
  end

  def to_param
    permalink
  end

end


