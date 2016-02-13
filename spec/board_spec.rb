require 'spec_helper'

describe Board do
  let(:new_board) {Board.new(7,7)}
  it 'creates a Board' do
    expect(new_board.board).to eq (Array.new(7) {Array.new(7)})
  end

end
