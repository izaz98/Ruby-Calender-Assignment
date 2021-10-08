class Event
    attr_accessor :title, :description, :time, :date, :year, :day

    def initialize(title, description, time, date, year, day)
        @day = day
        @year = year
        @date = date
        @time = time
        @title = title
        @description =  description
    end
end