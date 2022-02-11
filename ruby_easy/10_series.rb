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

=begin
LS Solution

# Problem
For our program, the details we need to keep in mind are as follows:

We'll be given two important values: a string of numerical digits & a number representing the desired 
length of the series.
Each possible series we extract must be consecutive numbers from the original string. That means, from the 
string '01234', '213' is not a valid option, but '123' is.

# Examples 
From the test cases shown above, we can see that we need to create a Series class. The class should have 
2 methods as follows:

a constructor that accepts a string of digits as an argument
a slices method that takes a number as an argument. That number is the length of the possible series we 
must determine. We can see from the provided test cases that the return value of this method is an array 
of arrays. Each sub-array contains a series of numbers.
Note that if the length is greater than the length of the number string, we need to throw an error.

We may also want to create some helper methods to assist us, but those are optional.

# Data
We are using both strings and numbers. We also need to use a collection to return all possible number 
series. We noted above under the 'Test Cases' heading that our series method should return an array. 
Each element of that array is itself an array, containing the digits of each series.

# Algo
constructor
Save the string of digits passed as an argument

Method: slices
Accept a number as an argument — the length.
Throw an error if the length is greater than the length of the number string
Starting with the first digit in the number string, create substrings of length size.
Save the digits of each substring (the series) into an array.
Return an array of arrays that contains every series.

# Code

class Series
  attr_accessor :str

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    number_string.chars.map(&:to_i).each_cons(length).to_a
  end
end

In the constructor, we simply save the number string for later use in a clearly-named instance variable.

Within slices, we raise an ArgumentError if the length is greater than the size of the number string.

The next line of slices can look rather dense, so let's break it down with an example of 1234 as our 
number string, and our length as 2. First, we use chars to break the number string into an array of 
characters: ['1', '2', '3', '4']. Next, we use map(&:to_i) to transform all of the digits into integers: 
[1, 2, 3, 4]. Then, we use each_cons(length).to_a to return sub-arrays of consecutive digits that are 
length in size: [[1, 2], [2, 3], [3, 4]].
=end
