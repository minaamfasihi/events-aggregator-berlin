class EventsController < ApplicationController
  require 'open-uri'

  def index
    @events = Event.all
  end
end
