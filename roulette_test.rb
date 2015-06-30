require 'minitest/autorun'
require './roulette'

class RouletteTest < Minitest::Test
  def test_play
    play_roulette('straight 32', 32, Roulette::WIN)
    play_roulette('straight 31', 32, Roulette::LOSE)

    play_roulette('rob red', 32, Roulette::WIN)
    play_roulette('rob red', 15, Roulette::LOSE)

    play_roulette('manque', 12, Roulette::WIN)
    play_roulette('manque', 20, Roulette::LOSE)
    play_roulette('manque', 0, Roulette::LOSE)

    play_roulette('passe', 20, Roulette::WIN)
    play_roulette('passe', 12, Roulette::LOSE)

    play_roulette('eoo even', 2, Roulette::WIN)
    play_roulette('eoo even', 3, Roulette::LOSE)
    play_roulette('eoo odd', 3, Roulette::WIN)
    play_roulette('eoo odd', 2, Roulette::LOSE)

    play_roulette('dozens first', 2, Roulette::WIN)
    play_roulette('dozens first', 22, Roulette::LOSE)
    play_roulette('dozens second', 22, Roulette::WIN)
    play_roulette('dozens second', 32, Roulette::LOSE)
    play_roulette('dozens third', 32, Roulette::WIN)
    play_roulette('dozens third', 2, Roulette::LOSE)

    play_roulette('snake', 5, Roulette::WIN)
    play_roulette('snake', 0, Roulette::LOSE)

    play_roulette('Snake', 5, Roulette::WIN)

    assert_raises(InvalidGametypeError) { play_roulette('foo', 5, Roulette::WIN) }
  end

  def test_split_bet
    play_roulette('split 1 4', 4, Roulette::WIN)
    play_roulette('split 2 5', 5, Roulette::WIN)
    play_roulette('split 3 6', 6, Roulette::WIN)

    assert_raises(InvalidSplitError) { play_roulette('split 1 5', 5, Roulette::WIN) }
    assert_raises(InvalidSplitError) { play_roulette('split 1 7', 7, Roulette::WIN) }
  end

  private

  def play_roulette(input, roll, result)
    game = Roulette.new(input, 100)
    game.roll = roll
    assert_equal game.play.first, result
  end
end
