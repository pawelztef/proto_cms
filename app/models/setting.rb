class Setting < ApplicationRecord
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one AppSettings row is created
  validates_inclusion_of :singleton_guard, :in => [0]
  attr_accessor :home_page

  def self.instance
    first_or_create!(singleton_guard: 0)
  end


end
