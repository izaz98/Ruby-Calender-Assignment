# frozen_string_literal: true

require_relative '../model/user'
require 'date'
require_relative '../controller/helper'

# This view class handles all the execution of code
class View
  include Helper

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

  def run
    user = User.new

    loop do
      print messages
      choice = gets.chop
      case choice
      when '1'
        title, description, event_date_time = input_event_details
        add_event(user, title, description, event_date_time)

        puts "\n Events Added Successfully"

      when '2'
        view_events(user)
      when '3'
        print 'Enter month (Jan 2021): '
        month_to_print = gets.chop

        show_month(user, month_to_print)
      when '4'
        view_events(user)
        events_count = user.events_length

        if events_count.positive?
          index = validate_index_input(is_edit: true, events_count: events_count)

          print "---Enter Event's new details---"
          title, description, time = input_event_details

          add_event(user, title, description, time, index)

          puts 'Event upated'
        end
      when '5'
        view_events(user)
        events_count = user.events_length
        if events_count.positive?
          index = validate_index_input(events_count: events_count)

          delete_event(user, index)
          puts 'Deleted Event'
        end
      when 'q'
        puts 'Exiting Event Handler'
        break
      else
        puts 'invalid input'
      end
    end
  end
end

view = View.new
view.run
