require_relative 'player'

class Connect_4
  attr_accessor :player_1, :player_2, :board, :turn
  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1)
    @player_2 = Player.new(name_2)
    @board = Array.new(7) {Array.new(7)}
    @turn =
  end

  def greet
  end

  def drop(column)
    # while column != 0..6
    #   "can't put there."
    #   column = gets.chomp
    # end
    count = 1
      board.reverse.map do |row|
        if row[column].nil?
            if turn == true
            row[column] = "x"
              turn != turn
            else
            row[column] = "o"
              turn != turn
            end
            break
        else  count += 1
        end
      end
      if count > 7
        false
        "can't put there. "
      end
  end

  def result(column)
    #row?
      #count = 1
      #array.map do |x|
      #is x same as the previous?
        #token = nil. token becomes x. that's 1.
        #token = x. token is x again. that's +1.
        #don't count nil.
        #return true if count is 4.
        count = 0
        previous = nil

      board.reverse[column].map do |x|
        if x == nil
          count = 0
        elsif x != previous
          to = x
          count = 0
        elsif x == previous
          previous = x
          count += 1
        end
      end

require'pry'
binding.pry


        if count >= 3
          "Connect 4!"
          if x == "x"
            "#{player_1} wins!"
          else
            "#{player_2} wins!"
          end
        else
          "please make a next move."
        end
      end
end
      #(x,y)
      #same column, consecutive row => x+1, y
        #board[0][0], board[1][0], board[2][0], board[3][0]
      #consecutive column, consecutive row => x+1, y+1
        #board[0][0], board[0][0], board[0][2], board[0][3]
      #consecutive column, same row => x, y+1
        #board[0][0], board[0][1], board[0][2], board[0][3]

#player_1 wins if x/ turn == true
#player_2 wins if o/ turn == false

game = Connect_4.new("Jean", "Ezra")

require'pry'
binding.pry


#greet
#prompt and assign player's names
#shows the board

#player to drops the piece.
#shows the board
#shows the result and play if no one wins.
