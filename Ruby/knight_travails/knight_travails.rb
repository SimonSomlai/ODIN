class Move
  attr_accessor :parent_pos, :position, :child_pos
  def initialize(parent = [], position = [], children = [])
    @parent_pos = parent
    @position = position
    @child_pos = children
  end
end

class Knight
  attr_accessor :board, :moves, :start
  def initialize
    @start = Move.new(nil) # Start position
    @end = [] # End position
    @board = [
      [0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7],
      [0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6],
      [0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5], [7, 5],
      [0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4],
      [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3],
      [0, 2], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2],
      [0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1],
      [0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
    @allowed_moves = [[-2, 1], [-2, -1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]] # Possible directions a knight can make
    @bottom_move = nil # Generated move matching @end position
    @bottom_row = [@start] # array of last possible moves
    @turns = 0
  end

  def show_board
    puts @board.each_slice(8) { |row| p row }
  end

  def set_position(start, finish)
    @start.position = [start[0], start[1]]
    @end = [finish[0], finish[1]]
    @board[@board.find_index(start)] = 'START'
    @board[@board.find_index(finish)] = 'FINISH'
  end

  def knight_moves(start, finish)
    set_position(start, finish) # Set start & end instance variables + mark them on board
    puts "\n"
    show_board # Show the playing board
    until @bottom_move != nil # Loop until a generated move matches the end position
      puts "Bottom row = #{@bottom_row.collect{|move| move.position }.uniq}"
      puts "\n Turn #{@turns += 1};"
      @bottom_row.uniq.each do |possible_move| # Meanwhile, for each of the last generated moves (bottom row in tree)
        generate_possible_moves(possible_move.position, possible_move) # Generate all valid moves from that position
      end
     end
    backtrace_path(@bottom_move) # Find all parent_pos for last move
  end

  # Sets @bottom_row to an array of valid Move's from all previous positions until one matches the end position
  def generate_possible_moves(position, parent = nil)
    parent = @start if @start.child_pos == []
    # Move from each position according to @allowed_moves, select the valid moves, Turn each in Move object
    @bottom_row += @allowed_moves.collect{|a, b| [position[0] + a, position[1] + b]}.select{|move| move[0].between?(0, 7) && move[1].between?(0, 7)}.collect{|move| Move.new(parent, move)}
    puts "Knight starts at square #{position} and wants to move towards #{@end}.\n-> Found #{@allowed_moves.collect{|a, b| [position[0] + a, position[1] + b]}.select{|move| move[0].between?(0, 7) && move[1].between?(0, 7)}.count} possible moves: #{@allowed_moves.collect{|a, b| [position[0] + a, position[1] + b]}.select{|move| move[0].between?(0, 7) && move[1].between?(0, 7)}}"
    # If a generated Move matches @end position, set @bottom_move to that Move
    @bottom_move = @bottom_row.select{|move| move.position == @end }.first if @bottom_row.any?{|move| move.position == @end }
    @bottom_row.shift # Remove element we've just looped over
    parent.child_pos = @bottom_row # Set possible moves from parent to generated valid moves
  end

  def backtrace_path(current, collection = [current.position])
    until current.parent_pos == nil
      collection << current.parent_pos.position
      current = current.parent_pos
    end
    puts "\n"
    puts "Search ended! Reached #{@end} in #{collection.length - 1} turns!"
    puts collection.reverse!
  end
end

game = Knight.new
game.knight_moves([0, 0], [5,4])
