class Mastermind
  def initialize
    @turns = 0
    @code = ['r','g','b','y'].to_a.shuffle[0,4]
    @response = ["_", "_", "_", "_"]
    @cg = {}
  end

  def start_game
    p "Welcome to mastermind, do you want to make a code or guess a code? (m/g)"
    if gets.chomp.downcase == "m"
      p "Welcome to mastermind, you can now make a 4-color combination (no doubles). The computer will then guess which one it is. You can do this by choosing from the following colors;"
      p "- red (r)"
      p "- green (g)"
      p "- blue (b)"
      p "- yellow (y)"
      p " "
      p "Set the combination by typing the colors in any order. (Example: rgby.). The computer will then generate an answer and you have to provide it feedback. Here are your options;"
      p ""
      p "'X' means the computer has picked the right colour for a right spot. Example: 'XXXX' (Computer got everything right!)"
      p "a 'O' means the computer has picked the right colour but the wrong spot. Example: 'OOOO' (All the right colours, but none in the right place)"
      p "a '_' means the computer has picked a wrong colour."
      p ""
      p "Alright, let's get started! What's your combination? (Example: rgby.)"
      set_code
      computer_guess
    else
      p "Welcome to mastermind, the computer has randomly generated a 4-color combination. You have to guess which one it is. You can do this by choosing from the following colors;"
      p "- red (r)"
      p "- green (g)"
      p "- blue (b)"
      p "- yellow (y)"
      p " "
      p "Guess the combination by typing the colors in any order. (Example: rgby.) You'll get back the exact matches and the right colours (in random order)"
      p ""
      p "an 'X' means you've picked the right colour for a right spot"
      p "a 'O'' means you've picked the right colour but the wrong spot"
      p "a '_' means you've picked a wrong colour."
      p ""
      p "What's your combination? (Example: rgby)"
      get_answer
    end
  end

  def get_answer
    answer = gets.chomp.downcase
    if answer.match(/[r,g,b,y][r,g,b,y][r,g,b,y][r,g,b,y]/).to_a != ""
      compare_answer(answer.split(""))
    else
      p "that's not a valid input, please try again. (sad trumpets)"
    end
  end

  def compare_answer(a)
    @code.each_with_index do |color, index|
      if (@code[index] <=> a[index]) == 0
        @response[index] = "X"
      else
        @response[index] = "O"
      end
    end
    keys = @cg.keys
    @cg[a.join()] = @response.join()
    p @cg
    if @response == ["X", "X", "X", "X"]
      p "Code cracked! - Well done :) You so supersmartz"
    else
      p "Hmm.. #{a.join}? That doesn't look right, here's your feedback: #{@response.shuffle.join}"
      p "Getting closer! Try again ♥"
      get_answer
    end
  end

  def set_code
    @code = gets.chomp.downcase.split("")
    p "Code set to '#{@code.join("")}'!"
    p "The computer will now start guessing!"
  end

  # Returns true if the current guess doesn't contain colors in positions that were wrong in the last answer
  def shuffled?(remaining, shuffled)
    shuffled_all = []
    remaining.each_with_index do |v, i|
      shuffled_all << (v <=> shuffled[i])
    end
    return shuffled_all.all? {|x| x != 0 }
  end

  # Returns true if the combination has already been tried
  def already_guessed?(answer)
    @cg[answer.join(",")] != nil
  end

  # Returns true if the current try has any colors in places that were wrong in the past.
  def wrong_positions?(answer)
    all_wrong = @cg.select {|k,v| v == "O,O,O,O"}
    all_wrong = all_wrong.keys.to_a
    check_all = []
    all_wrong.each do |string|
      string.split(",").each_with_index do |c, i|
        check_all << (c <=> answer[i])
      end
    end
    return (check_all.all? {|k| k != 0})
  end

  # Returns true if current guess matches the same amount of right colors as in previous guesses.
  def matches_right_ones?(guess)
    # Get the choices from previous ones where there was at least one was right!
    choices = @cg.select {|k,v| (v.split(",").index("X") != nil)}
    choices.each do |choice, value|
      same_ones = []
      # Get the number of right colors
      right_ones = (value.split(",").select{|x| x == "X"}).count
      choice.split(",").each_with_index do |color, index|
        same_ones << (color <=> guess[index])
      end
      # Compare the number of right colors in previous guesses with the positions of the current guess.
      correct = (right_ones == (same_ones.select{|x| x == 0}).count)
      correct == false ? break : (return true)
    end
  end

  def computer_guess(f=nil)
    if f
      keys = @cg.keys
      @cg[keys[@turns]] = f.join(",")
      new_answer = []
      remaining = []
      right = f.select {|v| v == "X"}
      p "So, I had #{right.size} right"
      p "Choices = #{@cg}"
      if right.size != 0
        right.size.times do |n|
          new_answer << keys[@turns].split(",")[n]
        end
      end
      remaining = keys[@turns].split(",")[right.size..3]
      shuffled = remaining.shuffle
      # Shuffle the wrongly-placed colors until none of them are in their original position and be sure the combination hasn't been guessed before!
      try = new_answer + shuffled
      until ((already_guessed?(try) == false) && (shuffled?(remaining, shuffled) == true) && (wrong_positions?(try) == true) && (matches_right_ones?(try) != nil))
        shuffled = remaining.shuffle
        try = new_answer + shuffled
      end
      p "Going to keep #{new_answer.empty? ? 'none' : new_answer.join(" & ")} and shuffle #{remaining.join(" & ")}"
      new_answer += shuffled
      p "Maybe this'll work: #{new_answer.join("")}"
      @cg[new_answer.join(",")] = ""
      p @cg
      @turns += 1
      provide_feedback
    else
      guess = ['r','g','b','y'].shuffle
      @cg[guess.join(",")] = ""
      p "Is it #{guess.join("")}?"
      provide_feedback
    end
  end

  def provide_feedback
    feedback = gets.chomp
    if feedback != "XXXX"
      p "Alright it wasn't that, next turn #{@turns + 1}"
      computer_guess(feedback.split(""))
    else
      p "Computer guessed it!"
    end
  end
end


game = Mastermind.new
game.start_game
