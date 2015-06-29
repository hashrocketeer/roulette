require 'minitest/autorun'
require './game'

class GameTest < Minitest::Test
  def test_play
    play_roulette('straight 32 100', 32, Game::WIN)
    play_roulette('straight 31 100', 32, Game::LOSE)

    play_roulette('rob red 100', 32, Game::WIN)
    play_roulette('rob red 100', 15, Game::LOSE)

    play_roulette('manque', 12, Game::WIN)
    play_roulette('manque', 20, Game::LOSE)
    play_roulette('manque', 0, Game::LOSE)

    play_roulette('passe', 20, Game::WIN)
    play_roulette('passe', 12, Game::LOSE)

    play_roulette('eoo even', 2, Game::WIN)
    play_roulette('eoo even', 3, Game::LOSE)
    play_roulette('eoo odd', 3, Game::WIN)
    play_roulette('eoo odd', 2, Game::LOSE)

    play_roulette('dozens first', 2, Game::WIN)
    play_roulette('dozens first', 22, Game::LOSE)
    play_roulette('dozens second', 22, Game::WIN)
    play_roulette('dozens second', 32, Game::LOSE)
    play_roulette('dozens third', 32, Game::WIN)
    play_roulette('dozens third', 2, Game::LOSE)

    play_roulette('snake', 5, Game::WIN)
    play_roulette('snake', 0, Game::LOSE)

    play_roulette('Snake', 5, Game::WIN)
  end

  def play_roulette(input, roll, result)
    game = Game.new(input)
    game.roll = roll
    assert_equal game.play.first, result
  end
end
