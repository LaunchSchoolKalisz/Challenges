=begin
Sum of Multiples
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all
the multiples of the numbers in the set that are less than the first number. If the set of numbers is not 
given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 
3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# Problem
- Create a program that takes a number, and a set of numbers
- Find the sum of all of the multiples of every number in the set that are less than the number given
- Default set - 3, 5

# Example
SumOfMultiples(3, 5).to(20) == 78
SumOfMultiples.to(20) == 78

# Data
- integer, array

# Algo
Constructor
- accepts a set of numbers, stored as an array
- default: [3, 5]

to
- Accepts an integer
- initiate a sum variable
- iterate through the set
  - Iterate through all numbers less than the integer provided
    - Select each number that is a multiple of the number in the first iteration
  - Sum the selected numbers and add that to the sum
- Return the sum
=end

class SumOfMultiples
  attr_accessor :set

  def initialize(*set)
    @set = set
    if set.empty? 
      self.set= [3, 5]
    end
  end

  def to(integer)
    multiples = [0]
    set.each do |set_num|
      1.upto(integer - 1) do |num|
        multiples << num if num % set_num == 0
      end
    end
    multiples = multiples.uniq
    multiples.sum
  end

  def self.to(integer)
    SumOfMultiples.new.to(integer) #== 51
  end
end
