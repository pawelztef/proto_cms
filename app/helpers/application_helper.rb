module ApplicationHelper
  def standard_date(date)
     date.strftime("%d-%m-%Y  %I:%M")
  end

  def read_time(post)
    return "#{(post.content.split.size/2.16/60).ceil} min read"
  end

  def site_favicon_tag
    favicon_link_tag url_for(Site.instance.favicon) if Site.instance.favicon.attached?
  end


end
