# == Schema Information
#
# Table name: publishables
#
#  id          :bigint           not null, primary key
#  ancestry    :string(255)
#  commentable :boolean          default(FALSE)
#  content     :text(65535)
#  permalink   :string(255)
#  status      :integer          default(0)
#  summary     :text(65535)
#  title       :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  site_id     :bigint
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

class Publishable < ApplicationRecord

  has_ancestry

  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :tagizations
  has_many :tags, :through => :tagizations
  belongs_to :site


  validates_uniqueness_of :title, :permalink
  validates_presence_of :title, :permalink


  # TODO methods is_page? & is_post need to be added

  def is_home?
    self.type == "HomePage"
  end

  def is_blog?
    self.type == "Blog"
  end

  def is_post?
    self.type == "Post"
  end

  def to_param
    permalink
  end

end


