require './roulette'

while(true) do
  puts "You are playing roulette, what is your game and arguments?"
  game_args = gets
  puts "And what is your bet?"
  bet = gets

  roulette = Roulette.new(game_args, bet)
  result, money = roulette.play
  result = result.to_s.split('::').last.downcase
  puts "You #{result} the #{roulette.gametype} bet, and #{result} $#{money}."
end
