# frozen_string_literal: true

# Event will be used to store details of a particular event
class Event
  attr_accessor :title, :description, :event_date_time

  def initialize(title, description, event_date_time)
    @event_date_time = event_date_time
    @title = title
    @description = description
  end

  def show_event
    event_date = event_date_time.strftime('%d %b %Y')
    event_time = event_date_time.strftime('%I:%M%p')
    "title: #{@title}, description: #{@description}, date: #{event_date}, time: #{event_time}"
  end
end
