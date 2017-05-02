class Game
  attr_accessor :rows, :turns
  def initialize
    @rows = [["_","_","_"],["_","_","_"],["_","_","_"]]
    @turns = 0
    # start_game
  end

  def start_game
    p "Welcome to Tic Tac Toe, here's the board;"
    show_board
    p "Player 1 starts the game, choose where you want to put your 'X' by indicating the row (1 to 3) and the position (1 to 3), separated by a ','. Example: 1, 3"
    get_answer
  end

  def show_board
     @rows.each{|row| p row}
  end

  def get_answer(answer=(gets.chomp.split(',').collect(&:to_i)))
    if answer.all? { |i| [1, 2, 3].include?(i) } # Check if valid
      modify_board(answer)
    else
      p "That isn't a valid row or position, please try again"
      get_answer
    end
  end

  def modify_board(arr)
    row, position = @rows[arr[0] - 1], arr[1] - 1
    if row[position] != '_'
      p 'That place is already taken, choose another one please'
      get_answer
    else
      @turns.even? ? (player_symbol = 'X') : (player_symbol = 'O')
      row[position] = player_symbol
      p "Placed '#{player_symbol}' in row number #{arr[0]} on position #{position}, new board layout;"
      show_board
      check_conditions
    end
    next_player
  end

  def next_player
    @turns += 1
    p "Alright, next player choose where you want to put your #{@turns.even? ? ('X') : ('O')} by indicating the row (1 to 3) and the position (1 to 3), separated by a ','. Example: 1, 3"
    get_answer
  end

  def end_game(condition)
    @turns.even? ? (player = 'X') : (player = 'O')
    p "#{player} won with a #{condition} combination! - Would you like to play another? (Y/N)"
    gets.chomp.casecmp('y').zero? ? (game = Game.new) : exit
  end

  # ----------------------- CHECK FOR CONDITIONS ----------------------------------------------
  def check_conditions
    horizontal?
    vertical?
    diagonal1?
    diagonal2?
  end

  def all_X_or_all_O?(collection, condition) # Checks filled array for all X or O's
    (collection.all? { |i| i == 'X' } || collection.all? { |i| i == 'O' }) ? (end_game(condition)) : false
  end

  def horizontal? # Check for each row if it has all X or O
    @rows.each {|col| all_X_or_all_O?(col, "horizontal")}
  end

  def vertical?
    3.times do |pos|
      col = @rows.collect { |i| i[pos] }
      all_X_or_all_O?(col, "vertical")
      pos += 1
    end
  end

  def diagonal1?(col=[]) # Top left to bottom right diagonal
    3.times do |pos|
      col[pos] = @rows[pos][pos]
    end
    all_X_or_all_O?(col,"top left to bottom right diagonal")
  end

  def diagonal2?(col=[], c=2) # Top right to bottom left diagonal
    3.times do |pos|
      col[pos] = @rows[pos][c]
      c -= 1
    end
    all_X_or_all_O?(col,"top right to bottom left diagonal")
  end
end

# game = Game.new
