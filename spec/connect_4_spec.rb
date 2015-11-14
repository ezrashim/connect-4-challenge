require 'spec_helper'

RSpec.Connect_4 do
  RSpec.describe '.new' do
    let (:game_1) {Connect4.new('Ezra', 'Jean')}
    let (:game_2) {Connect4.new( nil, nil )}
    it 'initiates a game with two players' do
      expect(game_1.player_1).to eq('Ezra')
      expect(game_1.player_2).to eq('Jean')
      expect{game_2}.to output("Please provide your name first").to_stdout
      end
    end

  RSpec.describe '#drop' do
    let (:)
    expect(game_1.player_1.drop(0)).to eq(game_1.board[][])
    #are the players alternating? (o || x)
    #when a column fills up => "can't put there."
    #is the drop outputting the correct spot? board[][]

  end

end
#game cannot proceed until they each specify a name.
#each name must be unique.

#player to select a column
#player must specify a valid column. If invalid then it must inform to select a valid column and not drop a game piece.
#when player specifies a valid column, place the game piece in the first avaialable row in that column.
#


# test if the grid exists.

# test if the grid raises an error when filled.
