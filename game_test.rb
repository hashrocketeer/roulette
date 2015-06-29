require 'minitest/autorun'
require './game'

class GameTest < Minitest::Test
  def test_play
    game = Game.new('straight 32')
    game.roll = 32
    assert_equal game.play, Game::WIN
    game.roll = 31
    assert_equal game.play, Game::LOSE

    game = Game.new('rob red')
    game.roll = 32
    game = Game.new('rob black')
    game.roll = 15
    assert_equal game.play, Game::WIN

    game = Game.new('manque')
    game.roll = 12
    assert_equal game.play, Game::WIN
    game.roll = 20
    assert_equal game.play, Game::LOSE
    game.roll = 0
    assert_equal game.play, Game::LOSE

    game = Game.new('passe')
    game.roll = 20
    assert_equal game.play, Game::WIN
    game.roll = 12
    assert_equal game.play, Game::LOSE

    game = Game.new('eoo even')
    game.roll = 2
    assert_equal game.play, Game::WIN
    game.roll = 3
    assert_equal game.play, Game::LOSE
    game = Game.new('eoo odd')
    game.roll = 3
    assert_equal game.play, Game::WIN
    game.roll = 2
    assert_equal game.play, Game::LOSE

    game = Game.new('dozens first')
    game.roll = 6
    assert_equal game.play, Game::WIN
    game.roll = 0
    assert_equal game.play, Game::LOSE
    game = Game.new('dozens second')
    game.roll = 18
    assert_equal game.play, Game::WIN
    game = Game.new('dozens third')
    game.roll = 32
    assert_equal game.play, Game::WIN

    game = Game.new('snake')
    game.roll = 5
    assert_equal game.play, Game::WIN
    game.roll = 0
    assert_equal game.play, Game::LOSE

    game = Game.new('Snake')
    game.roll = 5
    assert_equal game.play, Game::WIN
  end
end
