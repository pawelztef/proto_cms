class Blog < Page
  belongs_to :site
  has_many :posts
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one Site row is created
  validates_inclusion_of :singleton_guard, :in => [0]

  def self.instance
    first_or_create!(singleton_guard: 0, site: Site.instance) 
  end

end
