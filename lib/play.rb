require './player'
require './board'
require './game'

puts "Please put the name of player 1:"
name_1 = gets.chomp
puts "Welcome, #{name_1}!"

continue = true
while continue
  puts "please choose your token: x/o"
  token_1 = gets.chomp
  if token_1 == "x" || token_1 == "o"
    puts "your token is #{token_1}"
    continue = false
  else
    puts "your token can't be recognized"
  end
end

while true
  puts "Please put the name of player 2:"
  name_2 = gets.chomp

  if name_2 != name_1
    puts "Welcome, #{name_2}!"
    break
  else
    puts "player 2 cannot have the same name as player 1."
  end
end

if token_1 == "o"
  token_2 = "x"
  puts "your token is #{token_2}."
elsif token_1 == 'x'
  token_2 = "o"
  puts "your token is #{token_2}."
end

player_1 = Player.new(name_1, token_1)
player_2 = Player.new(name_2, token_2)
new_board = Board.new(7,7)
new_game = Game.new(player_1, player_2, new_board)
new_game.display_board

while true
  new_game.token_drop(player_1)

  if new_game.game_end == true
    puts "#{new_game.player_1.name} wins!!!"
    break
  end
  new_game.token_drop(player_2)
  if new_game.game_end == true
    puts "#{new_game.player_2.name} wins!!!"
    break
  end
end
