class Post < ApplicationRecord
  enum status: ContentStatus::STATUSES

  scope :published, ->  { where(status: :published) }
  scope :draft, -> { where(status: :draft) }


  def self.search_by_status(status)
    if status.blank?
      Post.all
    else
      Post.where(status: status)
    end
  end

  def to_param
    permalink
  end

end
