require 'minitest/autorun'
require './roulette'

class WinningsCalculatorTest < Minitest::Test
  def test_calculator
    assert_equal Roulette::WinningsCalculator.calculate('straight', 100), 3500
    assert_equal Roulette::WinningsCalculator.calculate('rob', 100), 100
    assert_equal Roulette::WinningsCalculator.calculate('manque', 100), 100
    assert_equal Roulette::WinningsCalculator.calculate('passe', 100), 100
    assert_equal Roulette::WinningsCalculator.calculate('eoo', 100), 100
    assert_equal Roulette::WinningsCalculator.calculate('dozens', 100), 200
    assert_equal Roulette::WinningsCalculator.calculate('snake', 100), 200
    assert_equal Roulette::WinningsCalculator.calculate('split', 100), 1700
    assert_equal Roulette::WinningsCalculator.calculate('street', 100), 1100
  end
end
