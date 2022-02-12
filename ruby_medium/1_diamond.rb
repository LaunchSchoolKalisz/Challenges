=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it 
prints a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

Examples

Diamond for letter 'A':
A

Diamond for letter 'C':
  A
 B B
C   C
 B B
  A

Diamond for letter 'E':
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

Problem
- Create a program which accepts 1 letter
- Outputs a string which is a diamond with that letter at its widest

Data: String, array

Algo
- Create a diamond class, no constructor
- Make diamond method
  - Accepts uppercase letter as input
  - check to see index num of the letter as compared to an array of the alphabet
  - number of spaces = index_num - 1
=end

class Diamond
  ALPHA = ('A'..'Z').to_a

  def self.make_diamond(middle_letter)
    idx_of_middle = ALPHA.index(middle_letter)
    number_of_spaces = idx_of_middle - 1

    diamond = ''

    number_of_middle_spaces = 0
    number_of_end_spaces = number_of_spaces + 1 

    0.upto(idx_of_middle) do |idx|
      middle_spaces = ""
      end_spaces = ""
      number_of_middle_spaces.times do |_| 
        middle_spaces << " " 
      end
      number_of_end_spaces.times do |_|
        end_spaces << " "
      end
      if idx == 0 
        diamond << "#{end_spaces}" + 'A' "#{end_spaces}" "\n"
        number_of_middle_spaces = 1
      else
        diamond << "#{end_spaces}" + ALPHA[idx] + "#{middle_spaces}" + ALPHA[idx] + "#{end_spaces}" "\n"
        number_of_middle_spaces += 2
      end
      number_of_end_spaces -= 1
    end
    bottom_half = diamond.chomp.reverse[number_of_middle_spaces..-1]
    diamond.chomp + bottom_half
  end
end

puts Diamond.make_diamond("E")