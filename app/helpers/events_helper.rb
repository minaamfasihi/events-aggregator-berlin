module EventsHelper
  def show_date(start_date = nil, end_date = nil)
    return [start_date.strftime('%m/%d/%y'), end_date.strftime('%m/%d/%y')].join(' to ') if start_date.present? && end_date.present?
    start_date.strftime('%m/%d/%y')
  end

  def image_url(img_url)
    img_url.blank? ? asset_path('event-default-img.png') : img_url
  end
end
