require './player'
require './board'

class Game
  attr_accessor :player_1, :player_2, :board
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
end
