# == Schema Information
#
# Table name: tags
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  name        :string(255)
#  slug        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ApplicationRecord
  has_many :tagizations
  has_many :posts, :through => :tagizations
  enum status: PostStatus::STATUSES

  def get_stats
    base_set = {}
    current_set = {}
    base_set["all"] = 0
    PostStatus::STATUSES.each { |status| base_set[status] = 0 }
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
