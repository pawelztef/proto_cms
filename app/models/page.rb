# == Schema Information
#
# Table name: pages
#
#  id                  :bigint           not null, primary key
#  ancestry            :string(255)
#  commentable         :boolean          default(FALSE)
#  content             :text(65535)
#  max_comment_nesting :integer          default(1)
#  name                :string(255)
#  permalink           :string(255)
#  status              :integer          default("draft")
#  summary             :text(65535)
#  type                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  site_id             :bigint
#
# Indexes
#
#  index_pages_on_ancestry   (ancestry)
#  index_pages_on_permalink  (permalink)
#  index_pages_on_site_id    (site_id)
#  index_pages_on_status     (status)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#

class Page < ApplicationRecord

  has_ancestry

  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :tagizations
  has_many :tags, :through => :tagizations
  belongs_to :site

  validates_presence_of :name, :permalink

  enum status: PageStatus::STATUSES

  PageStatus::STATUSES.each do |s|
    scope s, -> { where(status: s) }
  end

  def set_as_home
    Page.update_all(type: "")
    self.update_attributes(type: "HomePage", status: 1)
    return self.becomes(HomePage)
  end

  def set_as_blog
    Page.update_all(type: "")
    self.update_attributes(type: "Blog", status: 1)
    return self.becomes(Blog)
  end

  def self.search_by_status(status)
    if status.blank?
      Page.order(:ancestry)
    else
      Page.where(status: status)
    end
  end

  def to_param
    permalink
  end

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


