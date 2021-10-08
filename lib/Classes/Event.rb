class Event
    attr_accessor :title, :description, :time, :date, :year, :day

    def initialize(title, description, time, date, year, day, month)
        @day = day
        @year = year
        @date = date
        @time = time
        @month = month
        @title = title
        @description =  description
    end

    def to_s   
        "title: #{@title}, description: #{@description}, date: #{Date.new(@year,@month,@date)} time: #{@time}"
    end
end