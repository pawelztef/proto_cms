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

class Page < Publishable

  validates_presence_of :title, :permalink


  def set_as_home
    Page.update_all(type: "Page")
    self.update_attributes(type: "HomePage", status: 1)
    return self.becomes(HomePage)
  end

  def set_as_blog
    Page.update_all(type: "Page")
    self.update_attributes(type: "Blog", status: 1)
    return self.becomes(Blog)
  end

  def self.search_by_status(status)
    if status.blank?
      Page.order(:ancestry)
    else
      Page.where(status: status)
    end
  end

end
require_dependency "home_page"
require_dependency "blog"

