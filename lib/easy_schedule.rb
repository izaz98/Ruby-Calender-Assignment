require 'date'
require_relative "./Classes/Event"
require_relative "./helper"

if ARGV.length <= 0
    puts <<-ARGS_ERROR_MESSAGE
    Please enter the following commands to deal with events:
        1. create "title" "description" "3 Jan 2021 04:04 AM"
        2. viewa
        3. viewm "Janurary 2021" (view specific month)
        4. edelete "Janurary 2021"
        5. edelete "2 Janurary 2021"       
    ARGS_ERROR_MESSAGE
end

events = []
case ARGV[0]
when "create"
    puts "creating event"
when "viewa"
    puts "viewing event"
when "viewm"
    if ARGV.length==2
        month = DateTime.parse(ARGV[1])
        show_month(month)
    else
        puts "Invalid Args:\nPlease follow the syntax \"easy_schedule \"viewm\" \"Jan 2021\"\""
    end
when "edelete"
    puts "deleting"
else 
    puts ARGV.length, "invalid command"
end