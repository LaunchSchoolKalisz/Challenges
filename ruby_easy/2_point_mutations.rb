=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular 
DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect 
throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell 
with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated 
result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base 
with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with 
a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on 
the evolutionary path between the two strands.

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal 
length, you should compute the Hamming distance over the shorter length.

# Problem: 
- Create a program which calculates Hamming Distance

# Examples:
DNA.new('GGACTGA').hamming_distance('GGACTGA') == 0
DNA.new('').hamming_distance('') == 0

strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
DNA.new(strand).hamming_distance(distance) == 19

DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC') == 3

# Data:
String, array to split the string and compare indices

# Algo
DNA Class: constructor
- Create a DNA class that accepts 1 argument (string)
- Split the string into an array

Hamming Distance 
- Accepts 1 argument, comparison string
- Splits into array
- Distance tracker, starts at 0
- Iterate through smaller array (DNA vs comparison)
  - Compare with other array at the same index
  - If they are different, increase the distance tracker by 1
=end

class DNA
  attr_accessor :strand_array

  def initialize(strand)
    @strand = strand
    @strand_array = strand.split(//)
  end

  def hamming_distance(comparison_strand)
    comparison_array = comparison_strand.split(//)
    distance = 0
    smaller, larger = determine_smaller(strand_array, comparison_array)
    smaller.each_with_index do |component, index|
      distance += 1 if component != larger[index]
    end
    distance
  end

  def determine_smaller(strand_array, comparison_array)
    return [comparison_array, strand_array] if comparison_array.size < strand_array.size
    [strand_array, comparison_array]
  end
end

=begin
LS Solution

# Problem
For our program, the details we need to keep in mind are as follows:

We will be given two strands of DNA.
We need to count the differences between them.
If one strand is shorter than the other, we only need to check for differences for the length of the 
  shorter strand.

# Examples
From the test cases shown above, we can see that we need to create a DNA class. The class should have 2 
methods as follows:

A constructor that accepts a DNA strand string as argument. The constructor does not raise any errors.

A method that accepts a second DNA strand string as an argument and returns the differences between the 
two strands — the Hamming distance.

We may also want to create some helper methods to assist us, but those are optional.

# Data
We're given the DNA strands as strings. Additionally, we may want to use a collection to help us iterate 
through each character of the DNA strand.

# Algo
constructor
Accept a DNA strand string as an argument.
Save it for later use.
Method: Compute Hamming Distance (Ruby: hamming_distance; JavaScript: hammingDistance)

Compare the lengths of both DNA strands to determine which is shorter.
Set a counter to 0.
Based on the shorter strand's length, iterate through both DNA strand strings, at the same index, and 
compare each character.
If the characters are different, increase the counter.
Continue to the next index position.
Return the counter.

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end

=end
