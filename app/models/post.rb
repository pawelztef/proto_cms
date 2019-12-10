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

class Post < Publishable
  has_many :comments, as: :commentable

  attr_accessor :submit_option

  enum status: PublishableStatus::STATUSES
  PageStatus::STATUSES.each do |s|
    scope s, -> { where(status: s) }
  end

  def self.search_by_status(status)
    if status == "all" || !status.present?
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

  # TODO change permalink post field to slug
  def to_param
    permalink
  end


end
