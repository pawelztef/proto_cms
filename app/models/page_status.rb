class PageStatus
  STATUSES = %w(unvisible visible).freeze
  def initialize(status)
    @status = status
  end
end
