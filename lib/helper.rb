## add them to module

def validate_date_time(time)
    
    begin
        DateTime.parse(time)
    rescue ArgumentError
        puts "Please enter the time in correct order \"3 Jan 2021 04:04 AM\""
    end
end

def show_month(month)
    month_view_header = "M\tT\tW\tT\tF\tS\tS"
    month_start_day = month.cwday
    num_of_days = Date.new(month.year, month.month, -1).day
    puts month_view_header
    print "\t" * (month_start_day-1)
    1.upto(num_of_days) do |num| 
        print num, (month_start_day%7).zero? || num == num_of_days ? "\n" : "\t"
        month_start_day+=1
    end
end

def view_events(events)
    if events.length <= 0
        puts "No events found"
    else
        puts events
    end
end

def input_event_details
    print "Enter Title: "
    title = gets.chop
    print "Enter Description: "
    description = gets.chop
    print "Enter Time in format (3 Jan 2021 4:00 AM): "
    time = gets.chop

    time = validate_date_time(time)

    return title, description, time
end