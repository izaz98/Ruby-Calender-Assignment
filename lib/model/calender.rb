# frozen_string_literal: true

# Calnder class will be user to store the calender and events within it
class Calender
  attr_accessor :cur_year, :cur_month, :events

  def initialize(cur_month, cur_year, events)
    @cur_month = cur_month
    @cur_year = cur_year
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
      events.each.with_index { |event, index| print index + 1, '- ', event.show_event, "\n" }
    end
  end

  def delete_event(index)
    @events.delete_at(index)
  end

  def view_specific_month(month)
    month_view_header = "M\tT\tW\tT\tF\tS\tS"
    month_start_day = month.cwday
    num_of_days = Date.new(month.year, month.month, -1).day
    puts month_view_header
    print "\t" * (month_start_day - 1)
    1.upto(num_of_days) do |num|
      print num, (month_start_day % 7).zero? || num == num_of_days ? "\n" : "\t"
      month_start_day += 1
    end
  end
end
