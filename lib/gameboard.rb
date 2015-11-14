class Gameboard
  attr_reader :board
  def initialize
    @board =Array.new(7) {Array.new(7)}
  end

end
