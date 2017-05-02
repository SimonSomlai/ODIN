require 'spec_helper'
require 'tic-tac-toe'

describe 'Tic Tac Toe' do
  before do
    @game = Game.new
  end

  it 'correctly triggers end_game for horizontal rows' do
    expect(@game).to receive(:end_game).exactly(3).times
    @game.rows = [%w(X X X), ['', '', ''], ['', '', '']]
    @game.horizontal?
    @game.rows = [['', '', ''], %w(X X X), ['', '', '']]
    @game.horizontal?
    @game.rows = [['', '', ''], ['', '', ''], %w(X X X)]
    @game.horizontal?
  end

  it 'correctly triggers win condition for vertical row' do
    expect(@game).to receive(:end_game).exactly(3).times
    @game.rows = [['X', '', ''], ['X', '', ''], ['X', '', '']]
    @game.vertical?
    @game.rows = [['', 'X', ''], ['', 'X', ''], ['', 'X', '']]
    @game.vertical?
    @game.rows = [['', '', 'X'], ['', '', 'X'], ['', '', 'X']]
    @game.vertical?
  end

  it 'correctly triggers winning diagonals' do
    expect(@game).to receive(:end_game).twice
    @game.rows = [['X', '', 'X'], ['', 'X', ''], ['X', '', 'X']]
    @game.diagonal1?
    @game.diagonal2?
  end

  it "checks correctly for all X's and O's" do
    expect(@game).to receive(:end_game).with('condition').twice
    @game.all_X_or_all_O?(%w(X X X), 'condition')
    @game.all_X_or_all_O?(%w(O O O), 'condition')
    @game.all_X_or_all_O?(%w(O X O), 'condition')
    @game.all_X_or_all_O?(['', 'X', ''], 'condition')
  end

  let(:invalid) {[5,1]}
  it 'correctly marks errors in positions' do
    expect {@game.get_answer(invalid)}.to output("\"That isn't a valid row or position, please try again\"\n").to_stdout
  end
end
