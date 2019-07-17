class Page < ApplicationRecord
  # validates_uniqueness_of :permalink
  validates_presence_of :name, :permalink

  enum status: ContentStatus::STATUSES
    
  scope :published, ->  { where(status: :published) }
  scope :draft, -> { where(status: :draft) }


  def self.search_by_status(status)
    if status.blank?
      Page.all
    else
      Page.where(status: status)
    end
  end

  def to_param
    permalink
  end
end
