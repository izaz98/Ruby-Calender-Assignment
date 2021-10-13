# frozen_string_literal: true

require_relative '../model/calender'
require_relative '../model/event'

# This module contains the helper functions
module Helper
  def validate_date_time(event_date_time)
    DateTime.parse(event_date_time)
  rescue ArgumentError
    puts 'Please enter the time in correct order \"3 Jan 2021 04:04 AM\"'
  end

  def add_event(user, title, description, event_date_time, index = nil)
    event = Event.new(
      title,
      description,
      event_date_time
    )
    index ? user.calender.add_event_at_index(event, index - 1) : user.calender.add_event(event)
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
    print 'Enter Date Time in format (3 Jan 2021 4:00 AM): '
    event_date_time = gets.chop

    event_date_time = validate_date_time(event_date_time)

    [title, description, event_date_time]
  end

  def validate_index_input(is_edit: false, events_count: 0)
    print "Enter Index to #{is_edit ? 'edit: ' : 'delete: '}"
    while true
      index = Integer(gets.chop)
      break if index.positive? && index <= events_count

      print 'Invalid Index! Please Enter a valid Index: '
    end

    index
  end
end
