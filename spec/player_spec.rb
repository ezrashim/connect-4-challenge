require 'spec_helper'

describe Player do
  let(:new_player) {Player.new("Ezra", "x")}
  it 'creates a Player' do
    expect(new_player.name).to eq ("Ezra")
    expect(new_player.token).to eq ("x")
  end

end
