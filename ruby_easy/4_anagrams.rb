=begin
Anagrams
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that 
contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and 
"banana", the program should return a list containing "inlets". Please read the test suite for the exact 
rules of anagrams.

Problem:
- Create a program that accepts 2 arguments: word, list of possible anagrams
- iterates through the list, and creates a sublist that contains correct anagrams
- Anagram Rules: identical names are NOT anagrams, should be case insensitive

# Example
detector = Anagram.new('Orchestra')
anagrams = detector.match %w(cashregister Carthorse radishes)
# ['Carthorse']

detector = Anagram.new('corn')
anagrams = detector.match %w(corn dark Corn rank CORN cron park)
# ['cron']

# Data: string, array

# Algo
- Constructor
  - Accepts 1 parameter (string)

- match method
  - initiates an empty array
  - Accepts an array of strings
  - Iterate through the array
    - downcase
    - check to make sure the string is not the same as the provided word
    - check if angram, if so add the OG string to the results array
  - Return results array

- Angram method
  - Convert strings to array of characters
  - Sort each array
  - If the sorted arrays are the same, return true. Otherwise, false
=end

class Anagram
  attr_reader :buzzword

  def initialize(buzzword)
    @buzzword = buzzword.downcase
  end

  def match(potentials)
    results = []
    potentials.each do |word|
      downcased_word = word.downcase
      next if downcased_word == buzzword
      results << word if anagram?(downcased_word)
    end
    results
  end

  def anagram?(word)
    return true if word.chars.sort == buzzword.chars.sort
    false
  end
end
