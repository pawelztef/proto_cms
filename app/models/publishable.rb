# == Schema Information
#
# Table name: publishables
#
#  id                   :bigint           not null, primary key
#  ancestry             :string(255)
#  commentable          :boolean          default(FALSE)
#  content              :text(65535)
#  permalink            :string(255)
#  status               :integer          default("draft")
#  summary              :text(65535)
#  title                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  publishable_group_id :bigint
#  site_id              :bigint
#  user_id              :bigint
#
# Indexes
#
#  index_publishables_on_ancestry              (ancestry)
#  index_publishables_on_permalink             (permalink)
#  index_publishables_on_publishable_group_id  (publishable_group_id)
#  index_publishables_on_site_id               (site_id)
#  index_publishables_on_status                (status)
#  index_publishables_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (publishable_group_id => publishable_groups.id)
#  fk_rails_...  (site_id => sites.id)
#  fk_rails_...  (user_id => users.id)
#

class Publishable < ApplicationRecord

  has_ancestry

  has_many :comments, as: :commentable

  has_many :taxonomies
  has_many :taxons, through: :taxonomies
  has_many :categories, through: :taxonomies

  belongs_to :user
  belongs_to :site
  belongs_to :publishable_group

  attr_accessor :submit_option

  validates_uniqueness_of :title, :permalink
  validates_presence_of :title, :permalink


  enum status: PublishableStatus::STATUSES
  PublishableStatus::STATUSES.each do |s|
    scope s, -> { where(status: s) }
  end

  def self.search_by_status(status)
    if status == "all" || !status.present?
      Publishable.order(:ancestry)
    else
      Publishable.where(status: status)
    end
  end

  def self.get_stats
    stats = Publishable.all.group(:status).count
    stats["all"] = stats.inject(0) { |sum, hash| sum += hash[1] }
    return stats
  end

  def to_param
    permalink
  end

end


