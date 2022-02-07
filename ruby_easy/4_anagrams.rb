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

=begin
LS Solution

# Problem:
Some items from the instructions we want to keep in mind:

Our input is a word and a list of words. The first input is the pattern string, and the second input is an 
array of strings that may be anagrams of the pattern string.
From the instructions we can see that words are anagrams of each other when they have the same number of 
letters and the same exact letters as each other. Notice that enlists isn't an anagram of listen since it 
has an extra 's'.

# Examples:

From the test cases shown above, we can see that we need to create an Anagram class. The class should have 
2 methods as follows:

a constructor that takes the pattern word as an argument
a match method that takes a list of words as an argument (to test against the pattern we initialized in the 
constructor)
We may also want to create some helper methods to assist us, but those are optional.

The test cases confirm what the instructions suggested: anagrams must (a) be the same length, (b) have the 
same exact letters, abd (c) have the exact same number of the exact same letters. Letters cannot be reused.

Additionally, a word is not an anagram of itself (e.g. corn is not an anagram of corn). Anagrams are not 
case sensitive -- Orchestra and Carthorse are anagrams of each other.

Whether 0 anagrams, 1 anagram, or 5 anagrams are found, we need to return the output as an array — either 
of strings (when at least 1 anagram is found) or an empty array (in the case of 0 anagrams).

# Data: 
From the test cases, we can see that we're dealing with numbers and strings. We may want to use a 
collection (such as an array) for helpful built-in methods.

# Hints:
We can iterate over the list of possible anagrams and save those that are indeed anagrams.
Anagrams must:
be the same length
have the same exact letters
have the exact same number of the exact same letters. Letters cannot be reused.

One way to check for anagrams is to sort both the characters in the pattern and the possible anagram in the same way and check whether they are equal to each other:

pattern:  enlists       sorted: eilnsst
word:     listens       sorted: eilnsst

Since both "enlists" and "listens" have the exact same list of characters when sorted, the two words are 
anagrams of each other.

# Algo
constructor

save the argument in lowercase
Method: match

Initialize an empty list for the anagrams
Iterate over each word in the argument list
Convert word to lowercase
Is word an anagram of the word saved in the constructor?
Yes. Add this word to list of anagrams.
Return the list of anagrams.
Helper method to detect anagrams

Takes two arguments: the original word and the current word
Are the two words the same?
Yes. Return false.
Extract and sort all letters of the original word.
Extract and sort all letters of the current word.
Are the two sorted lists of letters the same?
Yes. Return true (the words are anagrams)
No. Return false (the words are not anagrams)

# Code & Discussion

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end

In the constructor, we went ahead and prepared the pattern to be used in the match method. We saved it in 
lowercase in @word.

In the match method, we used select, which enables us to return an empty array automatically if nothing 
meets our conditions, and a populated array if we find anagrams.

Next, in order to select the appropriate words, we use a helper method -- anagram?. This method method uses 
the sortedChars helper method to split each word into an array of sorted characters that we can easily 
compare.

We needed to make sure the words matched, but not too much: we also ensured that only words that weren't 
the exact pattern word were ignored in our selection of anagrams.
=end