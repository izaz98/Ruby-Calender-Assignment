# frozen_string_literal: true

require_relative '../model/calender'
require_relative '../model/event'

def validate_date_time(time)
  begin
    DateTime.parse(time)
  rescue ArgumentError
    puts 'Please enter the time in correct order \"3 Jan 2021 04:04 AM\"'
  end
end

def add_event(user, title, description, time, index)
  event = Event.new(
    title,
    description,
    time.strftime('%H:%M'),
    time.day,
    time.year,
    time.cwday,
    time.month
  )
  index != -1 ? user.calender.add_event_at_index(event, index - 1) : user.calender.add_event(event)
end

def show_month(user, month)
  user.calender.view_specific_month(month)
end

def view_events(user)
  user.calender.view_events
end

def delete_event(user, index)
  user.calender.delete_event(index - 1)
end

def input_event_details
  print 'Enter Title: '
  title = gets.chop
  print 'Enter Description: '
  description = gets.chop
  print 'Enter Time in format (3 Jan 2021 4:00 AM): '
  time = gets.chop

  time = validate_date_time(time)

  [title, description, time]
end

def validate_index_input(is_edit, events_count)
  print "Enter Index to #{is_edit ? 'edit: ' : 'delete: '}"
  while true
    index = Integer(gets.chop)
    break if index.positive? && index <= events_count

    print 'Invalid Index! Please Enter a valid Index: '
  end

  index
end
