=begin
Triangles

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of 
any two sides must be greater than the length of the third side.

Problem
- Write a program which accepts a triangle object
- Determine which type of triangle it is 

# Example
triange = Triangle.new(1, 1, 1)
triangle.kind ==> equilateral 
triange = Triangle.new(0, 0, 0) ==> ArgumentError
triange = Triangle.new(0, 0, -1) ==> ArgumentError
triangle = Triangle.new(1, 1, 3) ==> ArgumentError

# Data
Triange object, integer, determine different kinds, error handling

# Algo
Part 1: Create a triangle class which accepts 3 sides

Part 2: Determine if a triangle object is a trigangle
  - Check sides length > 0
  - Sum of the lengths of 2 sides must be greater than the length of the 3rd side
  - Throw Argument Errors if those are not true

Part 3: Kind 
 - Create a kind method
 - outputs which type of triangle it is
=end

class Triangle
  attr_accessor :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
    validate_triangle(@sides)
  end 

  def validate_triangle(sides)
    raise ArgumentError.new("Not a valid triangle! Each side must be greater than zero.") unless sides.all? {|side| side > 0}
    raise ArgumentError.new("Not a valid triangle!") unless valid_triangle?(sides)
  end

  def valid_triangle?(sides)
    return true if (sides[0] + sides[1] > sides[2]) && (sides[0] + sides[2] > sides[1]) && (sides[1] + sides[2] > sides[0])
    false
  end

  def kind
    kind = nil
    if equilateral?
      kind = 'equilateral'
    elsif isosceles?
      kind = 'isosceles'
    else
      kind = 'scalene'
    end
    kind
  end

  def equilateral?
    return true if sides.all? {|side| side == side1}
    false
  end

  def isosceles?
    return true if side1 == side2 && side1 != side3
    return true if side1 == side3 && side1 != side2
    return true if side2 == side3 && side2 != side1
    false
  end
end

=begin
LS Solution

# Problem
Important details we need to keep in mind:
- To be a valid triangle, each side length must be greater than 0.
- To be a valid triangle, the sum of the lengths of any two sides must be greater than the length of the 
  remaining side.
- An equilateral triangle has three sides of equal length.
- An isosceles triangle has exactly two sides of the equal length.
- A scalene triangle has three sides of unequal length (no two sides have equal length).

# Examples:
The provided test cases indicate that we need a Triangle class. We see that the class must have the 
following two methods:

a constructor that accepts three arguments representing three side lengths.

an exception is raised in the constructor if any side length is <= 0.
an exception is raised if the side lengths taken together don't describe a valid triangle
a method kind that returns a string representing the type of the triangle.

We may also want to create some helper methods to assist us, but those are optional.

# Data 
We can see from the provided test cases that we are going to be using numbers to create a new triangle 
and to determine its validity and type. The return value is a string.

What we need to think about how we might store a triangle's side lengths. It might be convenient to collect 
the three side-lengths into an array.

# Algo

constructor
Save the three side lengths
Check whether any side length is less than or equal to zero. If so, raise an exception.
Use comparisons to determine whether the sum of any two side lengths is less than or equal to the length of 
the third side. If so, raise an exception.

Method: kind
Compare the values representing the three side lengths
If all three side lengths are equal return 'equilateral'.
If the triangle is not equilateral, but any two side lengths are equal to one another, return 'isosceles'.
If none of the side lengths are equal to one another, return 'scalene'.

# Solution

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end

In our constructor, we place all of our side lengths into an array to make it simpler to pass around and for
easy access to Array methods. After doing so, we ensure that we raise an ArgumentError unless the three 
sides would create a valid triangle.

We extract this validation into its own helper method: valid?. First, we ensure that none of the sides are 
0 or less, and then we ensure that any two sides sum to a number greater than or equal to the remaining side.

Inside kind, we take a shorter logic approach. If all sides are equal, then there will only be one unique 
number in the sides array; thus, it's an equilateral. If two sides are equal, then there will be two 
unique numbers in the sides array; thus it's an isosceles. In all other cases — where all three sides are 
of differing lengths — it's a scalene triangle.
=end
