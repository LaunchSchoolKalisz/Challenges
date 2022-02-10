=begin
Beer Song

Write a program that can generate the lyrics of the 99 Bottles of Beer song. 
See the test suite for the entire song.


# Problem
- Create a program which generates the lyrics to 99 bottles of beer
Expected methods: 
  - lyrics: outputs entire song 99 to 0
  - verse: takes *parameters, outputs those verses
    - Special verses: 1, 0

# Example
test suite

# Data
- String, integer, range?, array

# Algo
constructor
 - none necessary

lyrics
 - output each verse from 99 to 0

verses

verse
 - accept a parameter
 - outputs the lyrics with the correct countdown

=end

class BeerSong
  def self.verse(verse_number)
    case verse_number
    when 0 
      lyrics = "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      lyrics = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      lyrics = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      lyrics = "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" +
      "Take one down and pass it around, #{verse_number - 1 } bottles of beer on the wall.\n"
    end
    lyrics
  end

  def self.verses(verse_max, verse_min)
    result = []
    (verse_min..verse_max).to_a.reverse.each {|num| result << verse(num)}
    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

=begin
LS solution

# Problem
We weren't given a lot of explicit information about what's required in the instructions. We need to 
extrapolate the requirements from the test cases. Pertinent information to keep in mind:

99 Bottles of Beer is a song with 100 verses. It begins with 99 bottles, and the number of bottles 
decreases until the number of bottles is 0 and there are "no more" bottles (the last verse).

Given that we need to produce the lyrics of the song, we can guess that we might need to return a string.

# Examples 
From the test cases shown above, we can see that we need to create a BeerSong class. The class should have 
3 methods as follows:

verse accepts one argument, a number. The number indicates how many bottles of beer should be present in 
the verse returned. The return value is a string representing a single verse of the song.

verses accepts two number arguments. The first argument is the number verse on which to start, and the 
second argument represents the number verse on which to end. The method should return a string representing 
all verses in this range (inclusive).

lyrics expects no arguments and returns a string representing the entire song (all 100 verses) counting 
down from 99 to "no more".

We may also want to create some helper methods to assist us, but those are optional.

# Data
We know that we will be working with strings, and using numbers to track our verses. 
We may also use an array to collect multiple verses before returning them as a single string.

# Hints
How are we going to handle verses that need a different grammatical syntax? e.g. 'bottles' versus 'bottle'.

The return value of the verses method should be a string that contains one verse of the song for every number between the first and second argument values, inclusive. The first argument should be greater than the second.

-   Each line of each verse should be separated by a newline.
-   Verses should be separated by a blank line (two consecutive newlines).

# Algo
Method: verse
Each line of the verse (there are two) should be separated by a newline
All mentions of the number of bottles should be replaced with the method's argument.
Return the verse string

Method: verses
The second argument should be less than the first, but greater than or equal to zero.
The first argument should be less than 100.
We can start with an empty string or array to hold our results
Count down from the first argument to the second (inclusive)
Handle verses that need either the singular bottle or no more bottles.
The verse when one bottle remains starts out as "Take it down" instead of "Take one down".
Add the string verse for each of these numbers to our result
Return result as a string

Method: lyrics
Build up a string containing all 100 verses of the song.
The verses should count down from 99 to "no more".
Each line of the verse should be separated by a newline.
Each unique verse should be separated by a blank line (2 newlines).
Return the string containing full lyrics.

# Code

class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles}" +
    " bottles of beer.\nTake one down and pass it around, " +
    "#{bottles-1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer " +
    "on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << "#{verse(current_verse)}"
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

Our BeerSong class has three class methods -- verse, verses, and lyrics. The verse class method creates a
new instance of the Verse class and invokes the single_verse instance method on that new object.

The BeerSong class's verses class method repeatedly invokes the verse method for each verse number within 
the provided range, and pushes the return value into the result array. After collecting all verses within 
the provided range, the result array is joined together with newline characters and returned as a string.

BeerSong's lyrics class method invokes verses with the arguments 0 and 99 in order to generate all lyrics.

The Verse class has a constructor method that expects one argument, the number representing the bottles 
in our verse. The single_verse instance method determines which type of verse is appropriate based on 
the number of bottles and returns the string returned from an invocation of the appropriate helper method

=end
