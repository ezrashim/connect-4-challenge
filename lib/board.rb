require 'pry'

class Board
  attr_accessor :board
  def initialize(row, column)
    @board = Array.new(row) { Array.new(column) }
  end
end
