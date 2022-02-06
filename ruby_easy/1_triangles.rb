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

triangle = Triangle.new(1, 1, 1)
p triangle.kind

triangle = Triangle.new(1, 3, 1)
p triangle
# triangle = Triangle.new(-1, 1, 1)
# p triangle 