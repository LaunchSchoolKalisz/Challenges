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
    bottom_half = diamond.chomp.reverse[number_of_middle_spaces..-1] + "\n"
    diamond = diamond.chomp + bottom_half
    diamond
  end
end

=begin
LS Solution

# Problem
We need to create a diamond of letters based on the input letter we receive. The requirements given in the 
instructions broke down all of the details we need to keep in mind. Again, they are:

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

# Example
From the test cases shown above, we can see that we need to create a Diamond class. This class only needs 
one method:

A method that accepts one argument, a letter. This method should return a diamond based on the input letter.
This method is defined as a static or class method.

A few additional details to note:

The diamond always begins and ends with the letter A. The second row of B has one space between letters. 
All subsequent rows have an additional 2 spaces between letters compared to the previous row.

We need to preserve the width of the longest row in the shorter rows. That is, if "E" is the longest row and 
is 9 characters long, the A row needs to be 9 characters long also.

We may also want to create some helper methods to assist us, but those are optional.

# Data
Our input and output for the method are both strings. We may also want to use arrays to build our diamond, 
because its built-in methods may prove helpful.

# Hint
The method to make a diamond should first determine what letters are needed in each row of the diamond. 
Once that is done, iterate over the letters creating one row at a time.

# Algo

Method to make a diamond (Ruby: make_diamond; JavaScript: makeDiamond)

Create a range of letters: 'A' until the given letter and then back to 'A' in reverse. Note that the given 
letter only appears once in this range.
Calculate the width of the diamond. We will use a helper method.
Iterate over the range of letters, and create a row for each current letter. We will use a helper method.
Center the row with spaces
Join all rows with a newline and append a final newline.
Helper method: make a row

If current letter is 'A', return 'A'.
If current letter is 'B', return 'B B'.
Create and return a string consisting of the current letter separated by the appropriate number of spaces. 
A helper method is useful here.
Helper method: determine spaces between letters

If the letter is 'A', return "" (an empty string).
If the letter is 'B', return " " (a single space).
Starting with letter C, the amount of spaces needed between letters is 3. Every subsequent letter needs 
two more spaces: D needs 5, E needs 7, etc.
Use a loop to figure out the amount of spaces needed based on this formula
Return the correct amount of spaces as a string
Helper method: determine width of diamond

If the letter is 'A', return 1
Otherwise, determine number of spaces between letters and add 2 for the letters at either end.
Additional helpers may be needed.

=end