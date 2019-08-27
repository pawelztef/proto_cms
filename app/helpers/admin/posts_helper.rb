module Admin::PostsHelper
  def generate_status_label post
    tag.span class: post.status == "published" ? "uk-label uk-label-default" : "uk-label uk-label-warning" do
      post.status
    end
  end


  def generate_categories_labels post
    tags = ""
    post.categories.each do |cat|
      tags << content_tag(:span, cat.name, class: "uk-label uk-label-default admin__posts-index_category-label").html_safe
    end
    tags.html_safe
  end

end
