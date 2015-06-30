class Squares
  def self.includes_center_tile?(numbers)
    ((5..32).step(3).to_a & numbers).size > 0
  end

  def self.valid_square?(numbers)
    center = (5..32).step(3).to_a & numbers
    center = center[0].to_i
    squares = []
    squares << [center, center - 1, center - 3, center - 4]
    squares << [center, center + 1, center - 2, center - 3]
    squares << [center, center + 1, center + 3, center + 4]
    squares << [center, center - 1, center + 2, center + 3]

    squares.map(&:sort).include? numbers.sort
  end

  def self.match?(numbers, roll)
    numbers.include? roll
  end

  def self.win?(numbers, roll)
    return false unless Squares.includes_center_tile?(numbers)
    return false unless Squares.valid_square?(numbers)
    return false unless Squares.match?(numbers, roll)

    true
  end
end
