require 'spec_helper'


RSpec.describe Gameboard do
  describe '.new' do
    it 'creates 7 x 7 board' do
      let (:gameboard) {Gameboard.new}
      expect(gameboard.board.size).to eq(7)
      expect(gameboard.board[0].size).to eq(7)
      expect(gameboard.board[0][0]).to eq(nil)
    end
  end
end
