class Game
  attr_accessor :board, :player1, :player2
  def initialize
    @board = [
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(1 2 3 4 5 6 7)]
    @turns = 1
  end

  # ----------------------- GENERAL METHODS  ---------------------------------------------- 
  def start_game
    puts "Welcome to connect-four! In this game you have to connect 4 (duh) chips inside the 6X7 playing grid.These can be horizontal, diagonal or vertical. Let's start with the player names. Player 1, what's your name;"
    @player1 = get_answer
    puts "Alright, #{@player1} it is, you'll be playing with light-colored chips (⚆). Player 2, whats your name? "
    @player2 = get_answer
    puts "#{@player2}, you'll be playing with dark-colored chips (⚈). Player 1 starts! Here's the starting board;"
    show_board
    loop_game
  end

  def get_answer
    gets.chomp
  end

  def show_board
    puts "\n Here's the board; \n"
    @board.each { |row| puts ' ' + row.join(' ') }
    puts "\n"
  end

  def loop_game
    until winning_condition?
      player = @turns.odd? ? @player1 : @player2
      puts "#{player}, in which collumn do you want to put your chip?"
      answer = get_answer.to_i
      valid_move?(answer, player) ? make_move(answer, player) : (p 'That move is invalid, try again'; loop_game)
    end
    end_game(player)
  end

  def end_game(player)
    puts "#{player} won the game! Play again? (y/n)"
    answer = get_answer.downcase
    answer == "y" ? restart_game : exit
  end

  def restart_game
    @board = [
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(1 2 3 4 5 6 7)]
    @turns = 1
    puts "Game restarted!"; show_board
    loop_game
  end

  # ----------------------- MAKING MOVES ---------------------------------------------- 

  def valid_move?(answer, _player)
    (answer.between?(1, 7) && @board[0][answer - 1] == '_') ? true : false
  end

  def make_move(collumn, player)
    color = player == @player1 ? "⚆" : "⚈"
    modify_board(color, collumn)
    puts "#{player} placed #{color} in collumn #{collumn}"
    @turns += 1
    show_board
  end

  def modify_board(color, collumn)
    chip_placed = false
    index = 0
    array = @board.collect { |row| row[collumn - 1] } # Get collumn top to bottom
    array.pop; array.reverse! # Turns collumn into arrays ["⚆","_","_"]
    until chip_placed # Loop over array until first empty position is found, place chip there
      if array[index] == '_'
        @board[@board.length - (index + 2)][collumn - 1] = color # Set chip
        chip_placed = true
      end
      index += 1
    end
  end

  # ----------------------- CHECKING WINNING CONDITIONS ---------------------------------------------- 

  def winning_condition?
    horizontal? || vertical? || diagonal? || anti_diagonal? ? true : false
  end

  def four_connected?(array, index) # Checks array for four consecutive colors, starting @ index
    true if (array[index..index + 3].all?{|color| color == "⚆"} || array[index..index + 3].all?{|color| color == "⚈"})
  end

  def horizontal? # Grab all rows and loop over 4 possible horizontal win combo's in that row
    6.times do |row|
      array = @board[row]
      4.times { |index| four_connected?(array, index) ? (return true) : next }
    end
    false
  end

  def vertical? # Grab all collumns and loop over 3 possible vertical win combo's in that collumn
    6.times do |index|
      array = @board.collect { |row| row[index] }
      array.pop; # Remove collumn number
      3.times { |index| four_connected?(array, index) ? (return true) : next }
    end
    false
  end

  # Get all top left to bottom right diagonals and add them to collection
  def diagonal?(board = @board, collection = [])
    # Length of the diagonal, starting row, starting position
    diagonal_length, row, position = 4, 2, 0
    until collection.length == 6
      array = []
      # For the length of the diagonal, grab each element.
      # Then shift 1 row down & 1 position to the right
      diagonal_length.times { |index| array << board[index + row][index + position] }
      collection << array
      case collection.length # After each collected diagonal..
      when 0...3 then row -= 1; diagonal_length += 1 # Decrease starting row
      when 3 then position += 1 # Same length, increase position
      when 4..6 then diagonal_length -= 1; position += 1 # Decrease diagonal, increase position
      end
    end
    collection.each do |diagonal|
      diagonal.length.divmod(4).inject(0, :+).times { |index| four_connected?(diagonal, index) ? (return true) : false }
    end
    false
  end

  def anti_diagonal? # Reverse the board and check for diagonals
    board = @board.reverse; board.shift
    diagonal?(board)
  end
end

connect_four = Game.new
connect_four.start_game
