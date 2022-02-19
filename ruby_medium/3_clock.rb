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

* Problem
For our program, the details we need to keep in mind are as follows:

Our clock objects should track hours and minutes.
We should be able to add minutes to and subtract minutes from our clock objects.
If two clock objects have the same time (both hour and minutes), they should be considered equal.
We may want our clock object to use 24-hour notation rather than 12-hour notation since we only need to 
  track hours and minutes, not the date.

* Examples
From the test cases shown above, we can see that we need to create a Clock class. The class should have 
several methods as follows:

- a constructor that accepts two number arguments representing the hour and minutes.
- a class or static method named at that can create and return a new instance of Clock. If the minutes 
  argument is omitted, a default value of 0 will be used.
- a method that returns the clock's current time as a string.
- methods that add and subtract from the current time. These methods accept a number of minutes to add or 
  subtract as an argument.
- a method that compares two clock objects for equality.
- We may also want to create some helper methods to assist us, but those are optional.

* Data 
The hours and minutes will be represented with numbers, and we will be working with numbers each time we 
add or subtract from the time.

The method that returns the clock's current time as a string must convert the hour and minutes to a string 
that is formatted properly: XX:XX.

* Algo
constructor
- Save the hours and minutes.
- There is no need to validate the arguments.

Static/Class Method: at
- Use a default value of 0 for the minutes if the 2nd argument is omitted.
- Call constructor to create a new object.
- Return the new object.

Method: Add Minutes to Clock (Ruby: +; JavaScript: add)
- Compute minutes since midnight for Clock object: use helper method "compute minutes since midnight".
- Add minutes argument to minutes since midnight.
- While (minutes since midnight >= 24 * 60)
- Subtract 24 * 60 from minutes since midnight
- Determine time represented by minutes since midnight: use helper method "compute time from minutes 
  since midnight"
- Return value returned by previous step.

Method: Subtract Minutes from Clock (Ruby: -; JavaScript: subtract)
- Compute minutes since midnight for Clock object: use helper method "compute minutes since midnight".
- Subtract minutes argument from minutes since midnight.
- While (minutes since midnight < 0)
- Add 24 * 60 from minutes since midnight
- Determine time represented by minutes since midnight: use helper method "compute time from minutes since 
  midnight"
- Return value returned by previous step.

Method: Determine Equality for two Clock Objects (Ruby: ==; JavaScript: isEqual)
- If both Clock objects have the same hours and minutes values, return true
- Otherwise, return false.

Method: Return string representation of Clock object (Ruby: to_s; JavaScript: toString)
- Format hours and minutes as HH:MM where HH and MM are both two digit numbers. If necessary, they should 
  have leading zeros.
- Helper method: compute minutes since midnight
- Return 60 * hours + minutes where hours and minutes are from the current Clock object.

Helper method: compute time from minutes since midnight
- One argument: minutes since midnight.
- See hints for the language of your choice.
- Return a new Clock object representing the computed time.

Ruby Solution and Discussion

class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end

In the constructor, we simply save the two arguments representing the hour and minute values as attributes 
in the newly created Clock object.

In the class method at, a default value of 0 is provided to the parameter minute. The new invokes the 
Clock class's constructor with the hour and minute values, and returns the resulting object.

+ and - are the most difficult pieces of logic to implement for this program. While its possible to write 
both of these methods by operating directly on the hour and minute attributes, this is clumsy and difficult. 
It's easier to compute the time in minutes since midnight, and then operate on those values. We use the 
compute_minutes_since_midnight method to perform this calculation. Note that we ensure the returned value 
is between 0 and 1439, inclusive (there are 1440 minutes in a day).

After adding or subtracting the number of minutes from minutes_since_midnight, we then make sure the result 
is again in the range of 0 through 1439. We can use minutes_since_midnight %= 24 instead of the loop in 
the + method, but the presence of negative numbers in - makes us more cautious. For consistency, we use a 
loop in both places.

In Ruby, we can drop both loops entirely and use minutes_since_midnight %= 24 instead, regardless of the 
negative numbers. However, the author's personal preference is to never use the % operator when negative 
numbers are a possibility -- the behavior of the % operator differs from one language to another when 
working with negative numbers.

Once we've got the number of minutes since midnight expressed as a value between 0 and 1439, inclusive, we 
can now calculate the appropriate time. We do that with the compute_time_from helper method. For 
simplicity, compute_time_from returns a new Clock object.

The to_s and == methods are pretty self-explanatory. In to_s, we return a string representation of the 
time, ensuring that both the hour and minutes are represented in a two-digit format (XX:XX). In == we 
simply compare the hour and minute values of both Clock objects in the comparison.
=end
