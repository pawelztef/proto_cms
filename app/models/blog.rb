class Blog < ApplicationRecord
  belongs_to :site
  has_many :posts
end
