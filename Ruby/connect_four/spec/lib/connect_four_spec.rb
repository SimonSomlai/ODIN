require 'spec_helper'
require 'connect_four'

describe Game do
  let(:connect_four) { Game.new }
  let(:horizontal_win) do
    [%w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ ⚆ ⚆ ⚆ ⚆ _ _),
     %w(_ _ _ _ _ _ _),
     %w(1 2 3 4 5 6 7)]
  end
  let(:vertical_win) do
    [%w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ ⚆ _ _ _ _ _),
     %w(_ ⚆ _ _ _ _ _),
     %w(_ ⚆ _ _ _ _ _),
     %w(_ ⚆ _ _ _ _ _),
     %w(1 2 3 4 5 6 7)]
  end
  let(:diagonal_win) do
    [%w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(⚆ _ _ _ _ _ _),
     %w(_ ⚆ _ _ _ _ _),
     %w(_ _ ⚆ _ _ _ _),
     %w(_ _ _ ⚆ _ _ _),
     %w(1 2 3 4 5 6 7)]
  end
  let(:anti_diagonal_win) do
    [%w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ ⚆ _ _),
     %w(_ _ _ ⚆ _ _ _),
     %w(_ _ ⚆ _ _ _ _),
     %w(_ ⚆ _ _ _ _ _),
     %w(1 2 3 4 5 6 7)]
  end

  def capture_stdout(&_block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end

  describe '#show_board' do
    it 'Correctly shows the starting board when show_board is called' do
      expect(capture_stdout { connect_four.show_board }).to eql("\n Here's the board; \n _ _ _ _ _ _ _\n _ _ _ _ _ _ _\n _ _ _ _ _ _ _\n _ _ _ _ _ _ _\n _ _ _ _ _ _ _\n _ _ _ _ _ _ _\n 1 2 3 4 5 6 7\n\n")
    end
  end

  describe '#initialize' do
    it 'Correctly sets players & empty board' do
      allow(connect_four).to receive(:gets) { "Simon\n" }
      allow(connect_four).to receive(:winning_condition?) { true }
      expect(capture_stdout { connect_four.start_game }).to be_a(String)
      expect(connect_four.player1).to eql('Simon')
      expect(connect_four.player2).to eql('Simon')
    end
  end

  describe '#make_move' do
    it 'Adds a piece to the board on the right location when make_move is called' do
      connect_four.make_move(3, @player1)
      expect(connect_four.board[5][2]).to include("⚆")
    end

    it 'Correctly stacks pieces when make_move is called on the same collumn twice' do
      connect_four.make_move(3, @player1)
      connect_four.make_move(3, @player1)
      expect(((connect_four.board.collect { |row| row[2] }).select { |i| i == "⚆" }).length).to be == 2
    end

    it 'Assigns different color to players' do
      connect_four.player1 = 'Simon'
      connect_four.player2 = 'Tom'
      connect_four.make_move(3, 'Simon')
      connect_four.make_move(3, 'Tom')
      expect((connect_four.board.collect { |row| row[2] })).to include("⚆", "⚈")
    end
  end

  describe '#valid_move?' do
    context 'When given a string or non-existant collumn' do
      it 'it returns false' do
        expect(connect_four.valid_move?(0, 'Simon')).to be == false
        expect(connect_four.valid_move?('sdsfsf'.to_i, 'Simon')).to be == false
      end
    end

    context 'When a collumn is completely full' do
      it 'it returns false' do
        connect_four.board[0] = ["⚆", "⚆", "⚆", "⚆", "⚆", "⚆", "⚆"]
        expect(connect_four.valid_move?(1, 'Simon')).to be == false
      end
    end
  end

  describe '#horizontal?' do
    context "When there's a horizontal winning combination" do
      it 'it returns true' do
        connect_four.board = horizontal_win
        expect(connect_four.horizontal?).to eql(true)
      end
    end

    context "When there's no horizontal winning combination" do
      it 'it returns false' do
        expect(connect_four.horizontal?).to eql(false)
      end
    end
  end

  describe '#vertical?' do
    context "When there's a vertical winning combination" do
      it 'it returns true' do
        connect_four.board = vertical_win
        expect(connect_four.vertical?).to eql(true)
      end
    end

    context "When there's no vertical winning combination" do
      it 'it returns false' do
        expect(connect_four.vertical?).to eql(false)
      end
    end
  end

  describe '#diagonal?' do
    context "When there's a diagonal (top left to bottom right) winning combination" do
      it 'it returns true' do
        connect_four.board = diagonal_win
        expect(connect_four.diagonal?).to eql(true)
      end
    end

    context "When there's no diagonal (top left to bottom right) winning combination" do
      it 'it returns false' do
        expect(connect_four.diagonal?).to eql(false)
      end
    end
  end

  describe '#anti_diagonal?' do
    context "When there's a anti-diagonal (bottom left to top right) winning combination" do
      it 'it returns true' do
        connect_four.board = anti_diagonal_win
        expect(connect_four.anti_diagonal?).to eql(true)
      end
    end

    context "When there's no anti-diagonal (bottom left to top right) winning combination" do
      it 'it returns false' do
        expect(connect_four.anti_diagonal?).to eql(false)
      end
    end
  end
end
