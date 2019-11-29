# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  ancestry   :string(255)
#  content    :text(65535)
#  name       :string(255)
#  permalink  :string(255)
#  status     :integer          default("draft")
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
#
# Indexes
#
#  index_pages_on_ancestry   (ancestry)
#  index_pages_on_permalink  (permalink)
#  index_pages_on_site_id    (site_id)
#  index_pages_on_status     (status)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#

class Blog < Page
  # == Schema Information
  #
  # Table name: blogs
  #
  #  id                  :bigint           not null, primary key
  #  commentable         :boolean          default(FALSE)
  #  max_comment_nesting :integer          default(1)
  #  name                :string(255)
  #  permalink           :string(255)
  #  singleton_guard     :integer          default(0)
  #  visible             :boolean          default(FALSE)
  #  created_at          :datetime         not null
  #  updated_at          :datetime         not null
  #  site_id             :bigint
  #
  # Indexes
  #
  #  index_blogs_on_site_id  (site_id)
  #
  # Foreign Keys
  #
  #  fk_rails_...  (site_id => sites.id)
  #

  belongs_to :site
  has_many :posts
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one Site row is created
  validates_inclusion_of :singleton_guard, :in => [0]

  def self.instance
    first_or_create!(singleton_guard: 0, site: Site.instance) 
  end

end
