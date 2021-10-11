# frozen_string_literal: true

# The User class is the top level heirarchy class
class User
  attr_accessor :calender

  def initialize
    @calender = Calender.new(Time.new.month, Time.new.year, [])
  end

  def events_length
    @calender.events.length
  end
end
