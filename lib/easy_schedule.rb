require 'date'
require_relative './Classes/evet'
require_relative './helper'

def messages
  <<-MESSAGE
  Please enter the following commands to deal with events:
      Press 1 to create event
      Press 2 to view all events
      Press 3 month view of a specific month
      Press 4 to edit an event
      Press 5 to delete an event
      Press q to quit\n
      Enter Your Choice:
  MESSAGE
end
events = []
loop do
  print get_messages
  choice = gets.chop
  case choice
  when '1'
    title, description, time = input_event_details
    events << Event.new(
                  title,
                  description,
                  time.strftime('%H:%M'),
                  time.day,
                  time.year,
                  time.cwday,
                  time.month
                )
    puts "\n Events Added Successfully"

  when '2'
    view_events(events)
  when '3'
    print 'Enter month (Jan 2021): '
    month_to_print = gets.chop

    month = Date.parse(month_to_print)
    month = Date.new(month.year, month.month)
    show_month(month)
  when '4'
    view_events(events)
    validate_index_input
  when '5'
    view_events(events)

    index = validate_index_input(false)

    events.delete_at(index)
    puts 'Deleted Event'
  when 'q'
    puts 'Exiting Event Handler'
    break
  else
    puts 'invalid input'
  end
end
