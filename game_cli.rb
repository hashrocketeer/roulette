require './game'

while(true) do
  puts "You are playing roulette what is your bet?"
  user_input = gets
  game = Game.new(user_input)
  result, money = game.play
  if result == Game::WIN
    puts "You win the #{game.gametype} bet, and $#{money}."
  else
    puts "You lose the #{game.gametype} bet, and $#{money}."
  end
end
