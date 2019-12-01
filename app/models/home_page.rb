# == Schema Information
#
# Table name: pages
#
#  id                  :bigint           not null, primary key
#  ancestry            :string(255)
#  commentable         :boolean          default(FALSE)
#  content             :text(65535)
#  max_comment_nesting :integer          default(1)
#  name                :string(255)
#  permalink           :string(255)
#  status              :integer          default("draft")
#  summary             :text(65535)
#  type                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  site_id             :bigint
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

class HomePage < Page

  def self.instance
    first_or_create!(name: 'home', permalink: 'home', site: Site.instance, status: 1)
  end

end
