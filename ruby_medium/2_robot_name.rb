=begin
Robot Name
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name 
is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets 
wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a 
risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

# Problem
Write a program that generates a random "robot name"

# Example
Robot.new.name == random name
robot.reset == different random name

# Data
- string

# Algo
constants: 0-9, A-Z

constructor
- assign a robot name
- current_name
- getter/setter for name

reset
- reassigns name
- checks it is not the same as the previous before assigning

name_picker
- generates random name from number/letter constants
=end

class Robot
  attr_accessor :name
  @@names = []

  def initialize
    @name = name_picker
  end

  def name_picker
    alpha = ("A".."Z").to_a
    nums = (0..9).to_a
    new_name = []

    2.times {new_name << alpha.sample}
    3.times {new_name << nums.sample}
    new_name = new_name.join
    validate_original_name(new_name)
    new_name
  end

  def validate_original_name(new_name)
    if @@names.include?(new_name)
      name_picker
    else
      @@names << name
    end
  end

  def reset
    self.name = name_picker
  end
end

# robot = Robot.new
# p robot.name
# robot.reset
# p robot.name
