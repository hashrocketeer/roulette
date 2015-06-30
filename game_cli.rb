require './roulette'

while(true) do
  puts "You are playing roulette, what is your game and arguments?"
  game_args = gets
  puts "And what is your bet?"
  bet = gets

  roulette = Roulette.new(game_args, bet)
  result, money = roulette.play
  if result == Roulette::WIN
    puts "You win the #{roulette.gametype} bet, and $#{money}."
  else
    puts "You lose the #{roulette.gametype} bet, and $#{money}."
  end
end
