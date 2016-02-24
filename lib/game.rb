require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player_1, :player_2, :board, :game_end, :connect
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @game_end = false
    @connect = 0
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
    while true
      if (column >= 0) && (column < column_size) && (row < row_size) && (board_rows.reverse[row][column] == nil)
        token_row = board_rows.reverse[row]
        token_row[column] = player.token
        connect_4?(row, column, player)
        if @game_end == true
          break
        end
        row = 0
        break
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

  def end_game?
    if @connect >= 4
      @game_end = true
    end
  end

  def connect_right?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row][column + 1]
      @connect += 1
      connect_right?(row, column + 1, player)
    end
  end

  def connect_left?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row][column - 1]
      @connect += 1
      connect_left?(row, column - 1, player)
    end
  end

  def horizontal_connect?(row, column, player)
    @connect = 1
    connect_right?(row, column, player)
    connect_left?(row, column, player)
    end_game?
  end

  def vertical_connect?(row, column, player)
    @connect = 1
    connect_up?(row, column, player)
    connect_down?(row, column, player)
    end_game?
  end

  def diagonal_connect?(row, column, player)
    @connect = 1
    connect_right_up?(row, column, player)
    connect_left_down?(row, column, player)
    end_game?
    @connect = 1
    connect_left_up?(row, column, player)
    connect_right_down?(row, column, player)
    end_game?
  end

  def connect_up?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row + 1][column]
      @connect += 1
      connect_up?(row + 1, column, player)
    end
  end

  def connect_down?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row - 1][column]
      @connect += 1
      connect_down?(row - 1, column, player)
    end
  end

  def connect_right_up?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row + 1][column + 1]
      @connect += 1
      connect_right_up?(row + 1, column + 1, player)
    end
  end

  def connect_left_down?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row - 1][column - 1]
      @connect += 1
      connect_left_down?(row - 1, column - 1, player)
    end
  end

  def connect_right_down?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row - 1][column + 1]
      @connect += 1
      connect_right_down?(row - 1, column + 1, player)
    end
  end

  def connect_left_up?(row, column, player)
    game_board = board.board.reverse
    if game_board[row][column] == game_board[row + 1][column - 1]
      @connect += 1
      connect_left_up?(row + 1, column - 1, player)
    end
  end

  def connect_4?(row, column, player)
    horizontal_connect?(row, column, player)
    vertical_connect?(row, column, player)
    diagonal_connect?(row, column, player)
  end
end
