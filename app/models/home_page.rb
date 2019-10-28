class HomePage < Page

  def self.set_as_homepage(id)
    Page.all.map { |n| n.type = (n.id == id) ? "HomePage" : nil ; n.save }
  end

  # future API development
  def as_json(options={})
    super(options.merge({ methods: :type }))
  end
end
