def show_month(month)
    month_view_header = "M\tT\tW\tT\tF\tS\tS"
    month_start_day = month.cwday
    num_of_days = Date.new(month.year, month.month, -1).day
    puts month_view_header
    print "\t" * (month_start_day-1)
    1.upto(num_of_days) do |num| 
        print num, month_start_day%7==0 ? "\n" : "\t"
        month_start_day+=1
    end
end