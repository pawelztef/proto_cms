class Page < ApplicationRecord
  include Permisable
  # validates_uniqueness_of :permalink
  validates_presence_of :name, :permalink
  before_save :generate_timestamp
  enum status: ContentStatus::STATUSES
  scope :published, ->  { where(status: :published) }
  scope :draft, -> { where(status: :draft) }
  def generate_timestamp
    self.stamp = DateTime.now.strftime("%s")
  end

  def to_param
    permalink
  end
end
