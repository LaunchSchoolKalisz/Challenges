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
