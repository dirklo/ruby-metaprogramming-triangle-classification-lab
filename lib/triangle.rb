class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    side1 = self.side1
    side2 = self.side2
    side3 = self.side3

    case
      when side1 <= 0 || side2 <= 0 || side3 <= 0 then false
      when side1 + side2 <= side3 then false
      when side2 + side3 <= side1 then false
      when side3 + side1 <= side2 then false
      else true
    end
  end

  def kind
    raise TriangleError if !self.valid?
    
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end  
  end


  class TriangleError < StandardError
  end
end
