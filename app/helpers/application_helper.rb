module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "home_page.title_home"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end
end
