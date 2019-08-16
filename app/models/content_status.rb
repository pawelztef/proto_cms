class ContentStatus
  STATUSES = %w(draft published).freeze
  def initialize(status)
    @status = status
  end
end
