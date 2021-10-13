# frozen_string_literal: true

# Calnder class will be user to store the calender and events within it
class Calender
  attr_accessor :current_year, :current_month, :events

  def initialize(current_month, current_year, events)
    @current_month = current_month
    @current_year = current_year
    @events = events
  end

  def add_event(event)
    @events << event
  end

  def add_event_at_index(event, index)
    @events[index] = event
  end

  def view_events
    if @events.length <= 0
      puts 'No events found'
    else
      events.each.with_index(1) { |event, index| print index, '- ', event.show_event, "\n" }
    end
  end

  def delete_event(index)
    @events.delete_at(index)
  end

  def view_specific_month(month)
    date = DateTime.parse(month)
    month_view_header = "M\tT\tW\tT\tF\tS\tS"
    month_start_day = date.cwday
    num_of_days = DateTime.new(date.year, date.month, -1).day
    print month_view_header, "\n", "\t" * (month_start_day - 1)
    1.upto(num_of_days) do |num|
      spaces = (month_start_day % 7).zero? || num == num_of_days ? "\n" : "\t"
      events_on_date = num_of_events_on_date(DateTime.new(date.year, date.month, num))
      print num, "#{events_on_date.positive? ? "(#{events_on_date})" : ''}", spaces
      month_start_day += 1
    end
  end

  private

  def num_of_events_on_date(date_time)
    count = 0
    date_time = date_time.strftime('%Y-%m-%d')
    @events.each do |event|
      event_date = event.event_date_time.strftime('%Y-%m-%d')
      count += 1 if event_date == date_time
    end
    count
  end
end
