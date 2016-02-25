require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player_1, :player_2, :board, :game_end, :connect, :count
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @game_end = false
    @connect = 0
    @count = false
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
    row = 0
    column_size.times do |column|
      row += 1
      print " #{row} "
    end
    puts "  "
  end

  def token_drop(player)
    puts "#{player.name}'s turn. Please choose the number to drop your token."
    column = gets.chomp.to_i - 1
    board_rows = board.board
    column_size = board.board.first.length
    row_size = board.board.length
    row = 0
    @game_end = false
    continue = true
    while continue
      if (column >= 0) && (column < column_size) && (row < row_size) && (board_rows.reverse[row][column] == nil)
        token_row = board_rows.reverse[row]
        token_row[column] = player.token
        connect?(row, column, player)
        if @game_end == true
          continue = false
        else
          row = 0
          continue = false
        end
      elsif (column < 0) || (column >= column_size) || (row >= row_size)
        puts "That can't be done #{player.name}. Please pick another column number."
        column = gets.chomp.to_i - 1
        row = 0
      else
        row += 1
      end
    end
    display_board
  end

  def connect?(row, column, player, y = 0, x = 0)
    game_board = board.board.reverse
    row_size = game_board.length
    if y == 0 && x == 0
      @count = false
      @connect = 0
      connect?(row, column, player, 0, 1)
    elsif (row + y) < row_size && game_board[row][column] == game_board[row + y][column + x]
      @connect += 1
      connect?(row + y, column + x, player, y, x)
    elsif @count == false
      @count = true
      @connect = 0
      connect?(row, column, player, -y, -x)
    elsif @count == true
      if @connect >= 3
        @game_end = true
      elsif y == 0 && x == -1
        @count = false
        @connect = 0
        connect?(row, column, player, 1, 0)
      elsif y == -1 && x == 0
        @count = false
        @connect = 0
        connect?(row, column, player, 1, 1)
      elsif y == -1 && x == -1
        @count = false
        @connect = 0
        connect?(row, column, player, -1, 1)
      end
    end
  end
end
