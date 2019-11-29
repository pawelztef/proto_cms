# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  ancestry   :string(255)
#  content    :text(65535)
#  name       :string(255)
#  permalink  :string(255)
#  status     :integer          default("draft")
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
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
  belongs_to :site

  # validates_uniqueness_of :permalink
  validates_presence_of :name, :permalink

  enum status: ContentStatus::STATUSES

  scope :published, ->  { where(status: :published) }
  scope :draft, -> { where(status: :draft) }


  def set_as_home
    Page.update_all(type: "")
    self.update_attributes(type: "HomePage", status: 1)
    return self.becomes(HomePage)
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
end
