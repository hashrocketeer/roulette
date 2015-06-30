require './roulette'

while(true) do
  puts "You are playing roulette, what is your game and arguments?"
  game_args = gets
  puts "And what is your bet?"
  bet = gets

  begin
    roulette = Roulette.new(game_args, bet)
    result, money = roulette.play
    result = result.to_s.split('::').last.downcase
    puts "You #{result} the #{roulette.gametype} bet, and #{result} $#{money}."
  rescue InvalidGametypeError
    puts 'That is not a valid gametype!'
  rescue InvalidSplitError
    puts 'That is not a valid split bet!'
  end
end
