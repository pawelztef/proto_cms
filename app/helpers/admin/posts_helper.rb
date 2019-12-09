module Admin::PostsHelper
  def generate_status_label post
    tag.span class: post.status == "published" ? "uk-label uk-label-default" : "uk-label uk-label-warning" do
      post.status
    end
  end

  # TODO create one generic method for generating categories and tags labels
  def generate_categories_labels post
    tags = ""
    post.categories.each do |cat|
      tags << raw(content_tag(:span, cat.name, class: "uk-label uk-label-default admin__posts-index_category-label"))
    end
    raw(tags)
  end
  def generate_tags_labels post
    tags = ""
    post.tags.each do |cat|
      tags << raw(content_tag(:span, cat.name, class: "uk-label uk-label-default admin__posts-index_category-label"))
    end
    raw(tags)
  end

  def generate_tabs_collection
    PublishableStatus::STATUSES.dup << "all"
  end

  def current_status?(status)
    if params[:status] == status 
      "pz-active"
    elsif !params[:status].present? && status == "all"
      "pz-active"
    end
  end

end
