require './player'
require './board'

class Game
  attr_accessor :player_1, :player_2, :board
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def display_board
    game_board = board.board
    column_size = game_board.first.length

    game_board.each do |row|
      line = ""
      row.each do |space|
        if space == nil
          space = " _ "
        else
          space = " #{space} "
        end
        line = line + space
      end
      puts "| #{line} |"
    end

    print "  "
    count = 0

    column_size.times do |column|
      count += 1
      print " #{count} "
    end

    puts "  "
  end

  def token_drop(player)
    puts "#{player.name}'s turn. Please choose the number to drop your token."
    number = gets.chomp.to_i
    column_size = board.board.first.length
    row_size = board.board.length
    count = 0
    while true
      if (number >= 1) && (number <= column_size) && (count < row_size) && (board.board.reverse[count][number - 1] == nil)
        board.board.reverse[count][number - 1] = player.token
        count = 0
        break
      elsif (number < 1) || (number > column_size) || (count >= row_size)
        puts "That can't be done #{player.name}. Please pick another column number."
        number = gets.chomp.to_i
        count = 0
      else
        count += 1
      end
    end
  end

end
