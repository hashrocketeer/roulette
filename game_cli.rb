require './game'

while(true) do
  puts "You are playing roullete what is your bet?"
  user_input = gets
  result = Game.new.play(user_input)
  puts result
end
