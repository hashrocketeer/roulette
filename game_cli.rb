require './game'

while(true) do
  puts "You are playing roullete what is your bet?"
  user_input = gets
  game = Game.new(user_input)
  result = game.play
  if result == Game::WIN
    puts "You win the #{game.gametype} bet"
  else
    puts 'You lose'
  end
end
