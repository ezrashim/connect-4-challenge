require 'spec_helper'
require_relative '../lib/player'

#player names
#each player can enter their name.
  RSpec.describe Player do
        let (:player_1) {Player.new("Ezra")}
        let (:player_2) {Player.new("Jean")}
    describe '.new' do
      it 'creates a name for each player' do

        expect(player_1.name).to eq("Ezra")
        expect(player_2.name).to eq("Jean")
      end
    end
  end
