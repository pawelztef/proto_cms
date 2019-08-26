module ApplicationHelper
  def standard_date(date)
     date.strftime("%d-%m-%Y  %I:%M")
  end
end
