class Page < ApplicationRecord
  validates_uniqueness_of :permalink
  validates_presence_of :name, :permalink

  def to_param
    permalink
  end
end
