module EventsHelper
  def render_date(start_date = nil, end_date = nil)
    return [start_date, end_date].join(' to ') if start_date.present? && end_date.present?
    start_date
  end
end
