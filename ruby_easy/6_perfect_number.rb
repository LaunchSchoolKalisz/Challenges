=begin
Perfect Number
The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), 
identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a 
comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided 
into the target number with no remainder, excluding the number itself). For instance, the positive divisors 
of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 
    and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
Write a program that can tell whether a number is perfect, abundant, or deficient.

# Problem
Write a program that takes a number and tells you if it is perfect, deficit, or abundant

# Exampes
PerfectNumber.classify(13) == 'deficient'
PerfectNumber.classify(28) == 'perfect'
PerfectNumber.classify(12) == 'abundant'

# Data: integers, array, string

# Algo
Constructor method
- Accepts an integer
- Calls aloquot_sum

Aloquot sum
- Initiates a sum variable = 0
- From 1 up to the number, check to see if the number can be divided evently
  - If so, add to the sum
- Return the sum

Classify
- Determines if aloquot sum is <=> the number given. Returns appropriate string
=end

class PerfectNumber
  def self.aloquot_sum(num)
    verify(num)
    sum = 0
    1.upto(num - 1) do |check|
      sum += check if num % check == 0
    end
    sum
  end

  def self.classify(num)
    sum = aloquot_sum(num)
    determination = 'string'
    if num == sum
      determination = 'perfect'
    elsif num < sum
      determination = 'abundant'
    elsif num > sum
      determination = 'deficient'
    end
    determination
  end

  def self.verify(num)
    raise StandardError.new("Not a valid number.") unless num > 0
  end
end
