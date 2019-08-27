class Post < ApplicationRecord
  has_many :categorizations
  has_many :categories, :through => :categorizations


  enum status: ContentStatus::STATUSES

  scope :published, ->  { where(status: :published) }
  scope :draft, -> { where(status: :draft) }


  def self.search_by_status(status)
    if status == "all" 
      Post.all
    else
      Post.where(status: status)
    end
  end

  def self.get_stats
    stats = Post.all.group(:status).count
    stats["all"] = stats.inject(0) { |sum, hash| sum += hash[1] }
    return stats
  end

  def to_param
    permalink
  end


end
