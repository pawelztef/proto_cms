class HomePage < Page

  belongs_to :site

  def self.instance
    first_or_create!(name: 'home', permalink: 'home', site: Site.instance)
  end

  # future API development
  def as_json(options={})
    super(options.merge({ methods: :type }))
  end
end
