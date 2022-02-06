=begin
Write some code that converts modern decimal numbers into their Roman number equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They 
invented concrete and straight roads and even bikinis. One thing they never discovered though was the number 
zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the 
system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date 
their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of 
straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII
 
There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend 
to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with 
the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

# Problem: Create a program which takes a modern number and converts it into roman numeral

# Examples
number = RomanNumeral.new(1)
number.to_roman == 'I'

number = RomanNumeral.new(2)
number.to_roman == 'II'

number = RomanNumeral.new(3)
number.to_roman == 'III'

number = RomanNumeral.new(4)
number.to_roman == 'IV'

number = RomanNumeral.new(5)
number.to_roman == 'V'

number = RomanNumeral.new(6)
number.to_roman == 'VI'

number = RomanNumeral.new(9)
number.to_roman == 'IX'

number = RomanNumeral.new(27)
number.to_roman == 'XXVII'

number = RomanNumeral.new(48)
number.to_roman == 'XLVIII'
 
number = RomanNumeral.new(59)
number.to_roman == 'LIX'

number = RomanNumeral.new(93)
number.to_roman == 'XCIII'

number = RomanNumeral.new(141)
number.to_roman == 'CXLI'

number = RomanNumeral.new(163)
number.to_roman == 'CLXIII'

number = RomanNumeral.new(402)
number.to_roman == 'CDII'

number = RomanNumeral.new(575)
number.to_roman == 'DLXXV'

number = RomanNumeral.new(911)
number.to_roman == 'CMXI'

number = RomanNumeral.new(1024)
number.to_roman == 'MXXIV'

number = RomanNumeral.new(3000)
number.to_roman == 'MMM'

Data: string, hash?

Algo
- Create a Roman numeral class, accepts an integer in constructor method
  - No error raising required
  
- to_roman method
  - Create a hash with base numerals and their values
  - Create an empty string to build
  - Split the number into an array of components 
    - Match with hash and add to empty string

=end

class RomanNumeral
  attr_accessor :number

  CONVERSION = {    
                "M" => 1000,
                "CM" => 900,
                "D" => 500,
                "CD" => 400,
                "C" => 100,
                "XC" => 90,
                "L" => 50,
                "XL" => 40,
                "X" => 10,
                "IX" => 9,
                "V" => 5,
                "IV" => 4,
                "I" => 1
              }

  def initialize(number)
    @number = number
  end

  def to_roman
    working_num = number
    roman_numeral = ""
    CONVERSION.each do |roman_num, value|
      loop do
        break if working_num < value
        roman_numeral << roman_num.to_s
        working_num -= value
      end
    end
    roman_numeral
  end
end

=begin
LS Solution

# Problem
For our program, the details we need to keep in mind are as follows:

I stands for 1
V stands for 5
X stands for 10
L stands for 50
C stands for 100
D stands for 500
M stands for 1,000

We don't have to worry about numbers higher than 3,000.
Modern Roman numerals are written by expressing each digit of the number separately, starting with the left 
most digit and skipping any digit with a value of zero

# Examples
From the test cases shown above, we can see that we need to create a RomanNumeral class. The class should 
have 2 methods as follows:

A constructor that accepts a non-Roman integer number as an argument. From the test cases, it appears that 
the constructor does not raise any errors.

A method that returns the Roman numeral representation of that number as a string. The name of this method 
will be either to_roman or toRoman depending on the conventions for your programming language of choice.

We may also want to create some helper methods to assist us, but those are optional.

# Data
Our input is an integer in our language of choice, and our output is a string. We may want to use some type 
of collection to help us create the desired output since it can make iteration easier. It might also be a 
good idea to have another collection hold some key conversions between numbers and Roman numerals.

We may also need a separate collection that holds key conversions between numbers and Roman numerals. How 
would ascending or descending order impact its ease of use?

# Algo
constructor

Accept a number as an argument.
Save it for later use.
Roman Numerals Collection

Create a collection that links important Roman numeral strings to their numeric counterparts.
Ensure this is in descending order.
Method: Convert to Roman Numerals (Ruby: to_roman; JavaScript: toRoman)

Initialize a variable with an empty string to save the finished Roman conversion.
Iterate over the Roman Numerals collection:
If the numeric value of the current Roman numeral is less than the value of the input number, add the Roman 
numerals to the string as many times as its value can fit. For instance, if the current Roman numeral is 
C (which has a value of 100) and the input number is 367, then 3 C's are needed: CCC.
Subtract the numeric value of the added Roman numerals from the current input value, and use the new input 
value in subsequent iterations. For instance, since we added CCC to the string above, we must subtract 
300 from 367, leaving us with a new input number of 67.

Return the result string.

# Code

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

In the ROMAN_NUMERALS constant, we created key value pairs that connect Roman numerals with their number 
equivalents in descending order. This sets it up well to be iterated through in the proper order.

In the constructor, we simply save the number argument for later use through an instance variable.

In to_roman, we first create a string to save our Roman numeral version of the number. We then 
initialize to_convert and assign it to the same number number is pointing to. This allows us to use that 
number without altering number's value.

We iterate through each of the key value pairs from the ROMAN_NUMERALS hash. divmod returns an array of 
two numbers: the first, how many times number is divisible by value and the second, the remainder of such 
division. If number is less than the value, the remainder will be the same as number and multiplier will 
be 0. But if the multiplier is anything greater than 0, we know that we need that letter or pair of 
letters in our Roman numeral conversion, so we add it to the string. And we need to add it to the string 
however many times it was evenly divided. Then we reassign number to our remainder.

After iterating through ROMAN_NUMERALS, we return the completed roman_version.

There is a potential problem with this solution: we're assuming that #each method will return the keys 
in the same order as shown in the declaration of ROMAN_NUMERALS. While this is true in recent versions of 
Ruby, there are no guarantees made. Furthermore, it's not good practice to rely on the ordering produced 
by Hash#each (nor with any other method that returns the keys, values, or key/value pairs from a hash).

As an extra challenge, try to fix this code so it doesn't depend on the ordering returned by the #each. To 
make sure your code works correctly, reverse the order of the entries in ROMAN_NUMERALS.

ROMAN_NUMERALS = {
  "I" => 1
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000,
}

=end
