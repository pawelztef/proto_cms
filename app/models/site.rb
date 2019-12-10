# == Schema Information
#
# Table name: sites
#
#  id                  :bigint           not null, primary key
#  catch_phrase        :string(255)
#  commentable         :boolean          default(FALSE)
#  company_name        :string(255)
#  max_comment_nesting :integer          default(1)
#  name                :string(255)
#  singleton_guard     :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  blog_page_id        :integer
#  home_page_id        :integer
#

class Site < ApplicationRecord
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one Site row is created
  validates_inclusion_of :singleton_guard, :in => [0]

  has_one_attached :logo
  has_one_attached :favicon

  has_many :pages

  attr_accessor :home_page
  attr_accessor :blog_page
  attr_accessor :page
  attr_accessor :visibility

  def self.instance
    first_or_create!(singleton_guard: 0)
  end

  def home_page
    return nil if self.home_page_id.nil?
    page = Page.find(self.home_page_id)
    return page
  end

  def home_page=(page)
    if page.is_a?(Page)
      self.update(home_page_id: page.id)
    elsif page.is_a?(Numeric)
      self.update(home_page_id: id)
    else
      raise ArgumentError, "Attribute is incorrect"
    end
  end

  def blog_page
    return nil if self.blog_page_id.nil?
    page = Page.find(self.blog_page_id)
    return page 
  end

  def blog_page=(page)
    if page.is_a?(Page)
      self.update(blog_page_id: page.id)
    elsif page.is_a?(Numeric)
      self.update(blog_page: id)
    else
      raise ArgumentError, "Attribute is incorrect"
    end
  end


end
