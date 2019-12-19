# == Schema Information
#
# Table name: sites
#
#  id              :bigint           not null, primary key
#  catch_phrase    :string(255)
#  company_name    :string(255)
#  name            :string(255)
#  singleton_guard :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  home_page_id    :integer
#

class Site < ApplicationRecord
  validates_inclusion_of :singleton_guard, :in => [0]

  has_one_attached :logo
  has_one_attached :favicon
  has_many :publishables
  has_many :publishable_groups

  attr_accessor :home_page

  def self.instance
    first_or_create!(singleton_guard: 0)
  end


  def home_permalink
    home_page.permalink
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


end
