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

player_1 = Player.new(name_1, token_1)

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

if player_1.token == "o"
  token_2 = "x"
  player_2 = Player.new(name_2, token_2)
  puts "your token is #{player_2.token}."
elsif player_1.token == 'x'
  token_2 = "o"
  player_2 = Player.new(name_2, token_2)
  puts "your token is #{player_2.token}."
end

new_game = Game.new(player_1, player_2, Board.new(7,7))
game_board = new_game.board.board
count = game_board.length
game_board.each do |row|
  line = ""
  row.each do |space|
    if space == nil
      space = " _ "
      line = line + space
    end
  end
  puts "#{count} | #{line} |"
  count -= 1
end
binding.pry
