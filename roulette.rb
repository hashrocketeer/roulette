require './squares'

class InvalidSplitError < StandardError; end
class InvalidGametypeError < StandardError; end

class Roulette
  attr_accessor :roll
  attr_reader :gametype

  class WIN; end
  class LOSE; end

  class WinningsCalculator
    PAYOUTS = { straight: 35, rob: 1, manque: 1, passe: 1, eoo: 1, dozens: 2, snake: 2, split: 17, street: 11, corner: 8 }

    def self.calculate(gametype, bet)
      if PAYOUTS.include?(gametype.to_sym)
        PAYOUTS[gametype.to_sym] * bet
      end
    end
  end

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
    'snake' => ->(_, roll) { [1, 5, 9, 12, 14, 16, 19, 23, 27, 30, 32, 34].include? roll },
    'split' => ->(split_pair, roll) { split_pair.include? roll.to_s },
    'corner' => ->(numbers, roll) { Squares.win?(numbers.map(&:to_i), roll) },
    'street' => ->(number, roll) do
      number = number.to_i
      number += 1 until number % 3 == 0
      [number, number - 1, number - 2].include?(roll)
    end
  }

  def initialize(game_args, bet)
    @roll = rand(37)
    @gametype, *@gametype_argument = game_args.strip.downcase.split(' ')
    @bet = bet.to_i
  end

  def play
    @gametype_argument = (@gametype_argument.length == 1 ? @gametype_argument.first : @gametype_argument)
    first, second = @gametype_argument
    if (@gametype == 'split') && !([first.to_i - 1, first.to_i - 3, first.to_i + 1, first.to_i + 3].include?(second.to_i))
      raise InvalidSplitError
    end

    if !WINNING_CONDITIONS.include?(@gametype)
      raise InvalidGametypeError
    end

    if WINNING_CONDITIONS[@gametype].call(@gametype_argument, @roll)
      money = WinningsCalculator.calculate(@gametype, @bet)
      [WIN, money]
    else
      [LOSE, @bet]
    end
  end
end
