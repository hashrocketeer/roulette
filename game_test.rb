require 'minitest/autorun'
require './game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_play
    @game.roll = 32
    assert_equal @game.play('straight 32'), 'You win the straight bet'
    assert_equal @game.play('straight 31'), 'You lose'

    assert_equal @game.play('rob red'), 'You win the rob bet'
    assert_equal @game.play('rob black'), 'You lose'

    @game.roll = 12
    assert_equal @game.play('manque'), 'You win the manque bet'
    @game.roll = 20
    assert_equal @game.play('manque'), 'You lose'
    @game.roll = 0
    assert_equal @game.play('manque'), 'You lose'

    @game.roll = 20
    assert_equal @game.play('passe'), 'You win the passe bet'
    @game.roll = 12
    assert_equal @game.play('passe'), 'You lose'

    @game.roll = 2
    assert_equal @game.play('eoo even'), 'You win the eoo bet'
    @game.roll = 3
    assert_equal @game.play('eoo even'), 'You lose'
    @game.roll = 3
    assert_equal @game.play('eoo odd'), 'You win the eoo bet'
    @game.roll = 2
    assert_equal @game.play('eoo odd'), 'You lose'

    @game.roll = 6
    assert_equal @game.play('dozens first'), 'You win the dozens bet'
    @game.roll = 0
    assert_equal @game.play('dozens first'), 'You lose'
    @game.roll = 18
    assert_equal @game.play('dozens second'), 'You win the dozens bet'
    @game.roll = 32
    assert_equal @game.play('dozens third'), 'You win the dozens bet'

    @game.roll = 5
    assert_equal @game.play('snake'), 'You win the snake bet'
    @game.roll = 0
    assert_equal @game.play('snake'), 'You lose'
  end
end
