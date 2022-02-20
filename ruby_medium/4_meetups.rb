=begin
Meetups
Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on 
the same day of the week. For example, a meetup's meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The teenth wednesday of December 2020
The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date. Each object takes a month number 
(1-12) and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in 
the specified month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should 
be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', 
and 'teenth'. The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. 
Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 
7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) 
will have exactly one date that is the "teenth" of that day in every month. That is, every month has 
exactly one "teenth" Monday, one "teenth" Tuesday, etc. The fifth day of the month may not happen every 
month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 
'Saturday', and 'Sunday'. Again, the case of the strings is not important.

* Problem
Create a class which takes a month number (1-12) and a year
  - day method which takes weekday and schedule
  - Determine date of the meetup as "day"th of "month", "year"

* Data
- Date objects, strings, integers

* Algo
- meetup class
  - constructor
    - accepts year, month

  - day
   - accepts day of the week, descriptor
   - returns a Date object 

   (wday returns day of the week, 0-6 sunday is 0)

=end

require 'date'

DESCRIPTOR_CONVERT = {first: 1, second: 2, third: 3, fourth: 4, fifth: 5, last: 6, teenth: 0}
# Need to figure out last, teenth
MONTHS = {
            1=>"January",
            2=>"February",
            3=>"March",
            4=>"April",
            5=>"May",
            6=>"June",
            7=>"July",
            8=>"August",
            9=>"September",
            10=> "October",
            11=> "November",
            12=> "December"
}

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(dotw, descriptor)
    counter = 1 
    dotw = dotw.downcase
    # descriptor = descriptor.downcase
    counter_to = DESCRIPTOR_CONVERT[descriptor.downcase.to_sym] 
    date = Date.new(year, month, 1)
    loop do
      loop do
        case dotw
        when "monday"
          break if date.monday?
        when "tuesday"
          break if date.tuesday?
        when "wednesday"
          break if date.wednesday?
        when "thursday"
          break if date.thursday?
        when "friday"
          break if date.friday?
        when "saturday"
          break if date.saturday?
        when "sunday"
          break if date.sunday?
        end
        date = date.next_day
      end
      break if counter == counter_to || counter_to == 0
      counter += 1
    end

    if counter_to == 6
      date = date - 7
    elsif counter_to == 0
      date
    else
      date
    end

  end

  # def return_format(date)
  #   "#{date.day}th of #{MONTHS[date.month]}, #{date.year}"
  # end 
end

# meetup = Meetup.new(2013, 3)
# p meetup.day('Monday', 'first')
