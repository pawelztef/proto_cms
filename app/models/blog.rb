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

class Blog < Publishable

  validates_presence_of :title, :permalink

  enum status: PageStatus::STATUSES
  PageStatus::STATUSES.each do |s|
    scope s, -> { where(status: s) }
  end

  def self.search_by_status(status)
    if status.blank?
      Page.order(:ancestry)
    else
      Page.where(status: status)
    end
  end

end

