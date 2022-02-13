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
      self.name = name_picker
    else
      @@names << name
    end
  end

  def reset
    self.name = name_picker
  end
end

=begin
LS Solution
# Problem
For our program, the details we need to keep in mind are as follows:

Since robot names are created randomly without input from a user, our program doesn't need to expect any 
input argument. The name we later return will be a string.
A robot's name is generated the first time it is booted up after being manufactured as well as the first 
time it is booted up after a factory reset.
The randomly generated names seem to follow a pattern of 2 uppercase alphabetic characters followed by 
three digits.

# Examples
From the test cases shown above, we can see that we need to create a Robot class. The class should have 
2 methods as follows:

a method named name that returns the robots randomly generated name (a string). The format of the name is 
2 uppercase alphabet characters followed by three digits.
a method named reset that restores the robot to factory functions. This means that any previously existing 
name for the robot is wiped and a new one must be generated.
We may also want to create some helper methods to assist us, but those are optional.

# Data
We know that we will be working with strings in order to generate and return a robot's name.

The problem description stated that we should make an effort to avoid collisions of the randomly 
generated names for various robots. This suggests that we might also want to use a static or class-level 
collection such as an array in order to track random names that have already been assigned to instances of 
the Robot class.

# Algo
Method: name

If the robot already has a name assigned, return that name.
If the robot does not yet have a name:
Generate a random name (using helper function).
Continue generating random names until the class-level collection being used to track names of existing 
robots does not include the newly generated name.
Save the robot's new name.
Save the name in the class-level collection used to track in-use names.
Return the name.

Method: reset

Remove the current value of the robot's name from the class-level collection that tracks the in-use names 
of all existing robots.

Remove the existing value of the robot's name from the object.

A falsy placeholder value might be appropriate

Helper Method to generate name

Begin with an empty name string.
Generate two random uppercase alphabetic characters and append them to the name string.
A helper function might be useful for generating the random letters.
Generate three random digits from 0-9 and append them to the name string.
A helper function might be useful for generating the random digits.
Return the name string.

# Code
class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = ''
    2.times { name << rand(65..90).chr }
    3.times { name << rand(0..9).to_s }
    name
  end
end
=end

