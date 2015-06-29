class Game
  attr_accessor :roll
  attr_reader :gametype

  class WIN; end
  class LOSE; end

  BOARD = {
    red: [32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3],
    green: [0],
    black: [15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26]
  }

  WINNING_CONDITIONS = {
    'straight' => ->(number, roll){ number.to_i == roll },
    'rob' => ->(color, roll){ BOARD[color.to_sym].include? roll },
    'manque' => ->(_, roll){ (1..18).include? roll },
    'passe' => ->(_, roll) { (19..36).include? roll },
    'eoo' => ->(evenness, roll) { (evenness == 'even' && roll.even?) || (evenness == 'odd' && roll.odd?) },
    'dozens' => ->(third_name, roll) { {'first' => 1..12, 'second' => 13..24, 'third' => 25..36}[third_name].include?(roll) },
    'snake' => ->(_, roll) { [1, 5, 9, 12, 14, 16, 19, 23, 27, 30, 32, 34].include? roll }
  }

  def initialize(user_input)
    @roll = rand(37)
    @gametype, @gametype_argument = user_input.strip.downcase.split(' ')
  end

  def play
    WINNING_CONDITIONS[@gametype].call(@gametype_argument, @roll) ? WIN : LOSE
  end
end
