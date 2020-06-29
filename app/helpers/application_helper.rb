module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "home_page.title_home"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def localize_datetime dtf
    dtf.strftime(I18n.t(:"dates.formats.date_month_year_concise", locale: I18n.locale))
  end

  def ld dtf
    localize_datetime(dtf)
  end
end
