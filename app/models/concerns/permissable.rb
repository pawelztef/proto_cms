module Permissable
  extend ActiveSupport::Concern 
  included do
    has_many :reviews, :as => :permissable
  end
end
