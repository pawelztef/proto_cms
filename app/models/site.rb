class Site < ApplicationRecord
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one Site row is created
  validates_inclusion_of :singleton_guard, :in => [0]
  has_one_attached :logo
  has_one_attached :favicon
  has_one :blog
  has_many :pages
  has_one :home_page

  accepts_nested_attributes_for :blog

  #attr_accessor :home_page

  def self.instance
    first_or_create!(singleton_guard: 0)
  end

end
