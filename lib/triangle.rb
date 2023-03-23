require 'pry'

class Triangle

  attr_accessor :l1, :l2, :l3

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end
  
  def kind
    lengths_arr = [l1, l2, l3]

    which_triangle(lengths_arr)
    if lengths_arr.sum <= 0
      raise TriangleError
    elsif lengths_arr[0] < 0 || lengths_arr[1] < 0 || lengths_arr[2] < 0
      raise TriangleError
    elsif l1 + l2 <= l3 || l2 + l3 <= l1 || l1 + l3 <= l2
      raise TriangleError
    else
      which_triangle(lengths_arr)
    end
  end

  def which_triangle(arr)
    if arr.uniq.size <= 1
      :equilateral
    elsif arr.uniq.size == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
