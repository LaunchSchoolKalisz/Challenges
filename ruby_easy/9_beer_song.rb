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
      lyrics = <<~SONG
      No more bottles of beer on the wall, no more bottles of beer
      Go to the store and buy some more, 99 bottles of beer on the wall.
      SONG
    when 1
      lyrics = <<~SONG
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
      SONG
    when 2
      lyrics = <<~SONG
      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.
      SONG
    else
      lyrics = <<~SONG
      #{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.
      Take one down and pass it around, #{verse_number - 1 } bottles of beer on the wall.
      SONG
    end
    lyrics
  end

  def self.verses(*verse_numbers)
    string = ''
    verse_numbers = ((verse_numbers.min)..(verse_numbers.max)).to_a.reverse
    verse_numbers.each {|num| string << BeerSong.verse(num)}
    string
  end

  def self.lyrics
    string = ''
    (0..99).to_a.reverse.each {|num| string << BeerSong.verse(num)}
    string
  end
end

p BeerSong.verse(99)
p BeerSong.verses(99, 98)
p BeerSong.lyrics
