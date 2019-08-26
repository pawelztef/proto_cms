module Admin::PostsHelper
  def status_label(status)
    tag.span class: status == "published" ? "uk-label uk-label-default" : "uk-label uk-label-warning" do
      status
    end
  end
end
