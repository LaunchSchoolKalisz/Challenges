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

DESCRIPTOR_CONVERT = {first: 1, second: 2, third: 3, fourth: 4, fifth: 5, last: nil, teenth: nil}

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
  attr_accessor :date

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month, 1)
  end

  def day(day_ot_week, desired_week)
    day_ot_week = day_ot_week.downcase
    desired_week = desired_week.downcase
    counter_to = DESCRIPTOR_CONVERT[desired_week.to_sym]

    if (1..5).to_a.include?(counter_to)
      date = determine_first_through_fifth(counter_to, day_ot_week)
    elsif desired_week == "last"
      date = determine_last(day_ot_week)
    elsif desired_week == "teenth"
      date = determine_teenth(day_ot_week)
    end
  end

  def determine_first_through_fifth(counter_to, day_ot_week)
    week_ot_month = 1 
    loop do
      self.date = determine_date(day_ot_week)
      break if week_ot_month == counter_to
      self.date += 1
      week_ot_month += 1
    end
    date.month == @month ? date : nil
  end

  def determine_last(day_ot_week)
    loop do
      self.date = determine_date(day_ot_week)
      break if date.month != @month
      self.date += 1
    end
    date - 7
  end

  def determine_teenth(day_ot_week)
    loop do
      self.date = determine_date(day_ot_week)
      break if date.day > 12
      self.date += 1
    end
    date
  end

  def determine_date(day_ot_week)
    loop do
      case day_ot_week
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
      self.date = date.next_day
    end
    date
  end 
end

=begin
LS Solution

* Problem
The details we need to keep in mind are as follows:

April, June, September, and November have 30 days.
February has 28 in most years, but 29 in leap years.
All the other months have 31 days.
The first day of the week of the month (DOWM) is always between the 1st and 7th of the month.
The second DOWM is between the 8th and 14th of the month.
The third DOWM is between the 15th and 21st of the month.
The fourth DOWM is between the 22nd and 28th of the month.
The fifth DOWM is between the 29th and 31st of the month.
The last DOWM is between the 22nd and the 31st of the month depending on the number of days in the month.

* Example
From the test cases shown above, we can see that we need to create a Meetup class. The class should have 
2 methods as follows:

a constructor that takes the year (e.g., 2020) and a month number (1-12)
a method that determines the date of the meetup in the specified year and month. This method takes a day 
of week (e.g., 'Monday' or 'Friday') and a schedule descriptor ('first', 'last', 'teenth', etc.) It 
returns the date as a Date object.

We may also want to create some helper methods to assist us, but those are optional.

* Data
From the test cases, it looks like we will be working with Date objects in our language of choice.

* Algo
** Hints
- Determine the 7 day period in which the meetup will occur. See the PEDAC: Understanding the Problem 
  section for the appropriate date ranges.
- Search the range of dates that contain the meetup date for the date that matches the desired day of week.
- Month numbers in Ruby Date objects range from 1 (January) to 12 (December).
- To determine the number of days in a specific month, you don't have to know whether the year is a leap 
  year, nor do you need to provide a list that shows the number of days in each month. You can determine 
  the last day of the month by using the Date class by passing a day argument of -1 to the Date.civil 
  method to create a Date object that represents the last day of the indicated year and month.

constructor
- Save the year and month
- Determine the last day of the month (28-31) (see hint above)

Method: day
- Convert the weekday and schedule descriptor to lowercase.
- Calculate the first possible day of the month for the meetup.
- Calculate the last possible day of the month for the meetup.
- Search the range of possible days for the date that occurs on the desired day of the week
- Return a date object for the first matching day or a value that indicates that a meetup date couldn't be 
  found.
=end