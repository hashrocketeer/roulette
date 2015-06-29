class Game
  attr_accessor :roll

  BOARD = {
    red: [32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3],
    green: [0],
    black: [15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26]
  }

  BETS = {
    'straight' => ->(bet, roll){ bet.to_i == roll },
    'rob' => ->(bet, roll){ BOARD[bet.to_sym].include? roll },
    'manque' => ->(bet, roll){ (1..18).include? roll },
    'passe' => ->(bet, roll) { (19..36).include? roll },
    'eoo' => ->(bet, roll) { (bet == 'even' && roll.even?) || (bet == 'odd' && roll.odd?) },
    'dozens' => ->(bet, roll) { (bet == 'first' && (1..12).include?(roll)) ||
                                (bet == 'second' && (13..24).include?(roll)) ||
                                (bet == 'third' && (25..36).include?(roll))
                              },
    'snake' => ->(bet, roll) { [1, 5, 9, 12, 14, 16, 19, 23, 27, 30, 32, 34].include? roll }

  }

  def initialize
    @roll = rand(37)
  end

  def play(input)
    gametype, bet = input.strip.split(' ')
    BETS[gametype].call(bet, @roll) ? win(gametype) : lose
  end

  def lose
    'You lose'
  end

  def win(gametype)
    "You win the #{gametype} bet"
  end
end