class Site < ApplicationRecord
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one Site row is created
  validates_inclusion_of :singleton_guard, :in => [0]
  has_one_attached :logo
  has_one_attached :favicon
  has_one :blog
  attr_accessor :home_page

  def self.instance
    first_or_create!(singleton_guard: 0)
  end

  def blog
    blog = Blog.first_or_create(permalink: "blog")
    blog.site = self
    blog.save!
    blog
  end

end
