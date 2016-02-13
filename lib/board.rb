require 'pry'

class Board
  attr_accessor :board
  def initialize(row, column)
    @board = Array.new(row) { Array.new(column) }
  end

  def display
    board.each do |row|
      print '|'
      row.each do |column|
        if column == nil
          print column.to_s.gsub!("", "   ")
        end
      end
      puts '|'
    end
    puts "  A  B  C  D  E  F  G"
  end

end
