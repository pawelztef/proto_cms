class HomePage < Page

# future API development
  def as_json(options={})
    super(options.merge({ methods: :type }))
  end
end
