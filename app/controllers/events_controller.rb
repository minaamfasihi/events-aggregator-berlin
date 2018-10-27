class EventsController < ApplicationController
  before_action :set_web_sources, only: [:index]

  def index
    @events = Event.all
    @events = @events.by_title(params[:title]) if params[:title].present?
    @events = by_web_source(@events, params[:web_source_id].to_i) if params[:web_source_id].present?
    @events = by_date(@events, params[:event_start_date], params[:event_end_date]) if params[:event_start_date].present? || params[:event_end_date].present?
  end

  private

  def event_params
    params.require(:event).permit(:title, :web_source_id, :event_start_date, :event_end_date)
  end

  def set_web_sources
    @web_sources = WebSource.all
  end

  def by_web_source(events, web_source_id)
    web_source_title = WebSource.find_by(id: web_source_id)&.title
    return if web_source_title.blank?

    case web_source_title
      when 'Co_Berlin'
        return events.coberlin
      when 'Berghain'
        return events.berghain
    end
  end

  def by_date(events, start_date = nil, end_date = nil)
    start_date = start_date.present? ? start_date : nil
    end_date = end_date.present? ? end_date : nil
    return if start_date.blank? && end_date.blank?

    if end_date.blank?
      events = events.by_start_date(start_date)
    elsif start_date.blank?
      events = events.by_end_date(end_date)
    else
      events = events.by_start_end_date(start_date, end_date)
    end
    events
  end
end
