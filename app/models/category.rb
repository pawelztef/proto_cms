class Category < ApplicationRecord
  has_many :categorizations
  has_many :posts, :through => :categorizations
  has_ancestry

end
