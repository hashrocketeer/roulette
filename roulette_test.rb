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

    play_roulette('street 2', 2, Roulette::WIN)
    play_roulette('street 2', 5, Roulette::LOSE)
    play_roulette('street 35', 34, Roulette::WIN)
    play_roulette('street 35', 30, Roulette::LOSE)
    play_roulette('street 31', 33, Roulette::WIN)

    play_roulette('corner 1 2 4 5', 1, Roulette::WIN)
    play_roulette('corner 1 2 4 6', 1, Roulette::LOSE)
    play_roulette('corner 1 2 20 32', 1, Roulette::LOSE)
    play_roulette('corner 1 2 4 5', 7, Roulette::LOSE)
  end

  def test_split_bet
    play_roulette('split 1 4', 4, Roulette::WIN)
    play_roulette('split 2 5', 5, Roulette::WIN)
    play_roulette('split 3 6', 6, Roulette::WIN)

    assert_raises(InvalidSplitError) { play_roulette('split 1 5', 5, Roulette::WIN) }
    assert_raises(InvalidSplitError) { play_roulette('split 1 7', 7, Roulette::WIN) }
  end

  private

  def play_roulette(input, roll, result, line=0)
    game = Roulette.new(input, 100)
    game.roll = roll
    assert_equal(result, game.play.first, "test from line #{line} failed")
  end
end
