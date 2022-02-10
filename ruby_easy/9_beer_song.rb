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

