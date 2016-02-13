require 'spec_helper'

describe Game do
  let(:new_board) {Board.new(7,7)}
  let(:player_1) {Player.new("Ezra", "x")}
  let(:player_2) {Player.new("Jean", "o")}
  let(:new_game) {Game.new(new_board, player_1, player_2)}
  it 'creates a game' do
    expect(new_game.class).to eq (Game)
  end

end
