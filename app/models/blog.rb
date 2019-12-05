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
#  status              :integer          default("unvisible")
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

class Blog < Page 

  has_many :posts

  #alias posts children

  def self.instance
    first_or_create!(site: Site.instance, title: "Blog", permalink: "blog", status: 1) 
  end

end
