require './player'
require './board'

class Game
  attr_accessor :player_1, :player_2, :board, :game
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @game = false
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
    number = gets.chomp.to_i
    board_rows = board.board
    column_size = board.board.first.length
    row_size = board.board.length
    row = 0
    @game = false
    while true
      if (number >= 1) && (number <= column_size) && (row < row_size) && (board_rows.reverse[row][number - 1] == nil)
        token_row = board_rows.reverse[row]
        token_row[number - 1] = player.token
        connect_4?(row, number, player)
        if @game == true
          break
        end
        row = 0
        break
      elsif (number < 1) || (number > column_size) || (row >= row_size)
        puts "That can't be done #{player.name}. Please pick another column number."
        number = gets.chomp.to_i
        row = 0
      else
        row += 1
      end
    end
    display_board
  end


  def horizontal_connect?(row, number, player)
    column_size = board.board.first.length
    token_row = board.board.reverse[row]

    connect = 0
    counter = 0
    while counter < column_size
      if token_row[counter] == player.token
        connect += 1
        counter += 1
        if connect >= 4
          puts "horizontal connect 4!"
          @game = true
          break
        end
      else
        connect = 0
        counter += 1
      end
    end
  end

  def vertical_connect?(row, number, player)
    row_size = board.board.length
    token_row = board.board.reverse[row]
    token_placement = token_row[number - 1]
    connect = 0
    counter = 0

    while counter < row_size
      if board.board.reverse[counter][number - 1] == player.token
        connect += 1
        counter += 1
        if connect >= 4
          puts "vertical connect 4!"
          @game = true
          break
        end
      else
        connect = 0
        counter += 1
      end
    end
  end

  def diagonal_connect?(row, number, player)
    column_size = board.board.first.length
    row_size = board.board.length
    token_row = board.board.reverse[row]
    column = number - 1
    token_placement = board.board.reverse[row][column]
    
    connect = 0
    counter_up = 0
    counter_down = 1

    while (row + counter_up < row_size) && (column + counter_up < column_size)
      if board.board.reverse[row + counter_up][column + counter_up] == player.token
        connect += 1
        counter_up += 1
        if connect >= 4
          puts "diagonal connect 4!"
          @game = true
          break
        end
      else
        break
      end
    end

    while (connect < 4) && (row - counter_down >= 0) && (column - counter_down >= 0)
      if board.board.reverse[row - counter_down][column - counter_down] == player.token
        connect += 1
        counter_down += 1
        if connect >= 4
          puts "diagonal connect 4!"
          @game = true
          break
        end
      else
        break
      end
    end

    connect = 0
    counter_up = 0
    counter_down = 1

    while (row + counter_up < row_size) && (column - counter_up >= 0)
      if board.board.reverse[row + counter_up][column - counter_up] == player.token
        connect += 1
        counter_up += 1
        if connect >= 4
          binding.pry
          puts "diagonal connect 4!"
          @game = true
          break
        end
      else
        break
      end
    end

    while (connect < 4) && (row - counter_down >= 0) && (column + counter_down < column_size)
      if board.board.reverse[row - counter_down][column + counter_down] == player.token
        connect += 1
        counter_down += 1
        if connect >= 4
          binding.pry
          puts "diagonal connect 4!"
          @game = true
          break
        end
      else
        break
      end
    end
  end

  def connect_4?(row, number, player)
    horizontal_connect?(row, number, player)
    vertical_connect?(row, number, player)
    diagonal_connect?(row, number, player)
  end
end
