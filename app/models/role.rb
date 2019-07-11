class Role 
  ROLES = %w(editor admin owner).freeze
  def initialize(role)
    @role = role 
  end
end
