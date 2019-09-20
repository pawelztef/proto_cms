class Category < ApplicationRecord
  has_many :categorizations
  has_many :posts, :through => :categorizations
  has_ancestry

  enum status: ContentStatus::STATUSES

  def get_stats
    base_set = {}
    current_set = {}
    base_set["all"] = 0
    ContentStatus::STATUSES.each { |status| base_set[status] = 0 }
    if self.posts
      current_set = self.posts.group(:status).count unless self.posts.empty?
      current_set["all"] = current_set.inject(0) { |sum, hash| sum += hash[1] }
    else 
      return base_set
    end
    return base_set.merge(current_set)
  end

  def search_by_status(status)
    if status == "all" || !status.present?
      self.posts
    else
      self.posts.where(status: status)
    end
  end

  def to_param
    slug
  end

end
