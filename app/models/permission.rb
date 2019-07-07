class Permission < ApplicationRecord
  has_and_belongs_to_many :roles
  enum name: [:read, :write, :delete]
end
