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
