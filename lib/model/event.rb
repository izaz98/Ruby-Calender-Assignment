# frozen_string_literal: true

# Event will be used to store details of a particular event
class Event
  attr_accessor :title, :description, :time, :date, :year, :day

  def initialize(title, description, time, date, year, day, month)
    @day = day
    @year = year
    @date = date
    @time = time
    @month = month
    @title = title
    @description = description
  end

  def show_event
    "title: #{@title}, description: #{@description}, date: #{Date.new(@year, @month, @date)} time: #{@time}"
  end
end
