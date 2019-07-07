class Role < ApplicationRecord
  has_and_belongs_to_many :permission
  has_many :users
  enum name: [:subscriber, :author, :admin]
end
