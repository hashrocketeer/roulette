require 'minitest/autorun'
require './squares'

class SquaresTest < Minitest::Test
  def test_includes_center_tile?
    assert_equal true, Squares.includes_center_tile?([1, 2, 4, 5])
    assert_equal false, Squares.includes_center_tile?([1, 2, 4, 6])
  end

  def test_valid_square?
    assert_equal true, Squares.valid_square?([1, 2, 4, 5])
    assert_equal false, Squares.valid_square?([1, 2, 4, 6])
  end

  def test_match?
    assert_equal true, Squares.match?([1, 2, 4, 5], 1)
    assert_equal true, Squares.match?([1, 5, 4, 2], 1)
    assert_equal true, Squares.match?([4, 5, 7, 8], 4)
    assert_equal false, Squares.match?([1, 2, 4, 5], 7)
  end

  def test_win?
    assert_equal true, Squares.win?([1, 2, 4, 5], 1)
    assert_equal false, Squares.win?([1, 2, 4, 6], 1)
    assert_equal false, Squares.win?([1, 2, 20, 32], 1)
    assert_equal false, Squares.win?([1, 2, 4, 5], 7)
  end
end
