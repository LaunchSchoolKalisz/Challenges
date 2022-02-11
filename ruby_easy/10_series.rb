=begin
Series
Write a program that will take a string of digits and return all the possible consecutive number series 
of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

# Problem
Create a program that takes a string of digits
- Method which takes a specified length
- Return all possible consecutive numbers of that length for that string

# Examples
series = Series.new('37103')
series.slices(2) == [[3, 7], [7, 1], [1, 0], [0, 3]]

series = Series.new('01234')
series.slices(3) == [[0, 1, 2], [1, 2, 3], [2, 3, 4]]

series = Series.new('31001')
series.slices(3) == [[3, 1, 0], [1, 0, 0], [0, 0, 1]]

# Data
Integer, Array, string

# Algo
Constructor
- Accepts a string of integers

Slice
- Throws error if the slice number is bigger than the length of the integer
- Split the string into an array of integers
- Initiate a results array
- Iterate through the array with index
  - send an array at the current index to the current index + slice number to results
  - break when the index + slice number is greater than string length + 1

=end

class Series
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def slices(slice_num)
    raise ArgumentError.new("Number of slices is too large!") if slice_num > string.size
    array = string.chars.map(&:to_i)
    results = []
    array.each_with_index do |num, index|
      break if index + slice_num > array.size
      results << array[index...index + slice_num]
    end
    results
  end
end



