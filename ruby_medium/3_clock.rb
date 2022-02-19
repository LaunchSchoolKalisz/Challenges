=begin
Clock
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given clock 
object. Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

# Problem
- Create a clock object (military time)
- Methods
  - at(hours, minutes)
  - +(minutes)
  - -(minutes)
- Should be able to compare 

# Data
String, array?

# Algo
#at
- accepts an integer (hours) and an optional integer (minutes)

#to_s 
- formats hours and minutes as hours:minutes

#+
- accepts an integer()
- adds that amount of time to the clock

#-
- accepts an integer()
- subtracts that amount of time from the clock

# ==
- compare using hours and minutes
=end

class Clock
  attr_accessor :hour, :minutes

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def to_s
    self.hour = update_format(hour)
    self.minutes = update_format(minutes)
    "#{hour}:#{minutes}"
  end

  def update_format(number)
    if number < 10
      number = "0" + number.to_s
    else
      number = number.to_s
    end
  end

  def +(adtl_minutes)
    p minutes
    self.minutes = minutes.to_i + adtl_minutes
    loop do
      break if minutes < 60
      self.hour = hour.to_i + 1
      self.minutes -= 60
    end
    p hour
    p minutes
    self.at(hour, minutes)
  end

  def -(adtl_minutes)
  end

  def ==
  end
end

p Clock.at(8).to_s + 3
p Clock.at(9).to_s
p Clock.at(11, 9).to_s

=begin 
LS Solution
=end
