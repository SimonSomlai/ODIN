require 'pstore'
$store = PStore.new("savegame")

class Hangman
  attr_accessor :word
  def initialize
    word = File.open("../words.txt").collect {|w| w.downcase.strip() }.sample
    @solution = "".rjust(word.length, "_").strip().split("")
    @word = word.split("")
    @turns = 10
    @guesses = ""
    @misses = -1
    @hangman = [[%{









                   ━┻━
                }], [%{
                       ┏
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃    ╭╶╮
                       ┃    ╰╶╯
                       ┃
                       ┃
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃    ╭╶╮
                       ┃    ╰╶╯
                       ┃     │
                       ┃     │
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃    ╭╶╮
                       ┃    ╰╶╯
                       ┃    ╲│
                       ┃     │
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃    ╭╶╮
                       ┃    ╰╶╯
                       ┃    ╲│╱
                       ┃     │
                       ┃
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃    ╭╶╮
                       ┃    ╰╶╯
                       ┃    ╲│╱
                       ┃     │
                       ┃    ╱
                       ┃
                       ┃
                       ━┻━
                }], [%{
                       ┏━━━━━┓
                       ┃     ┃
                       ┃    ╭××╮
                       ┃    ╰╶╶╯
                       ┃    ╲│╱
                       ┃     │
                       ┃    ╱ ╲
                       ┃
                       ┃
                       ━┻━
    }]]
  end

  def start_game
    saved_game?
    p "Welcome to hangman! A new random word has just been generated for you to guess! Guess the right letters by typing them into the console! You have 10 tries remaining, else you hang ;)"
    p "Here's the word:"
    p @solution.join(" ")
    guess
  end

  def saved_game?
    $savegame = $store.transaction{ $store[:savegame] }
    $savegame != nil ? (p "A savefile is found, do you want to load this in? (Y/N)"; choice = gets.chomp.downcase; choice == "y" ? load_game : false;) :  (return false;)
  end

  def save_game!
	savegame = $store.transaction { $store[:savegame] }
	if savegame != nil
	p "A savefile already exists, overwrite it? (Y/N)"
	choice = gets.chomp.downcase
	if choice == "y"
	  $store.transaction do
	    $store[:savegame] = nil
	    $store[:savegame] = self
	  end
	  p "Game overwritten, exiting now."
	  exit
	else
	  p "Overwrite canceled, returning to game.."
	  self.guess
	end
	else
	$store.transaction { $store[:savegame] = self }
	p "Game succesfully saved, exiting now."
	exit
	end
  end

  def load_game
    $savegame.guess(true)
  end

  def guess(save=false)
    if(save)
      $saved = true
      p "Loaded savefile succesfully! Here's your word again;"
      p @solution.join(" ")
      p "Still #{@turns} turns left,let's try further! You've already guessed: #{@guesses.split("").join(",")}"
    end
    p "What letter do you think is included in this word? (save current game by typing 'save')"
    guess = gets.chomp.downcase
    if guess == "save"
    	save_game!
    else
      @guesses << guess
      give_feedback(guess)
    end
  end

    def give_feedback(guess)
      (@word.include? guess) ? (reveal_letters(guess)) : (hang(guess))
    end

    def reveal_letters(letter)
      p "You've guessed correctly! #{letter} is part of the word!"
      @word.each_with_index do |l, i|
        if (l <=> letter) == 0
          @solution[i] = letter
        end
      end
      if @solution == @word
        p "Oh boy! You've guessed the word :)! It was #{@word.join("")}!"
        print %{
       __   __                                _
       \ \ / /__  _   _  __      _____  _ __ | |
        \ V / _ \| | | | \ \ /\ / / _ \| '_ \| |
         | | (_) | |_| |  \ V  V / (_) | | | |_|
         |_|\___/ \__,_|   \_/\_/ \___/|_| |_(_)
                                          
      }
      if($saved)
        File.delete("savegame")
        p "Savefile succesfully completed and automatically deleted!"
      end
      p "Do you want to play again? (Y/N)"
      choice = gets.chomp.downcase
      choice == "y" ? new_game : exit
    else
      p @solution.join(" ")
      p "Alright still #{@turns} turns left,let's try further! You've already guessed: #{@guesses.split("").join(",")}"
      guess
    end
  end

  def hang(letter)
    @turns -= 1
    p "You've guessed wrongly :(, #{letter} isn't part of the word!"
	@misses += 1
	print @hangman[@misses].join("").to_s
	if (@turns == 0)
	  game_over
	else
	  p "Here's the word again:"
	  p @solution.join(" ")
	  p "Ah crap, only #{@turns} turns left, let's try again! You've already guessed: #{@guesses.split("").join(",")}"
	  guess
	end
  end

  def game_over
	p "Oooh boy, guess it's game over for you buddy!"
    p "The right word was '#{@word.join("")}'"
	print %{
	____                         ___
	/ ___| __ _ _ __ ___   ___   / _ \__   _____ _ __
	| |  _ / _` | '_ ` _ \ / _ \ | | | \ \ / / _ \ '__|
	| |_| | (_| | | | | | |  __/ | |_| |\ V /  __/ |   
	\____|\__,_|_| |_| |_|\___|  \___/  \_/ \___|_|   
	                                        
	}
    if($saved)
      File.delete("savegame")
      p "Savefile succesfully completed and automatically deleted!"
      p "Do you want to play again? (Y/N)"
    end
    choice = gets.chomp.downcase
    choice == "y" ? new_game : exit
  end

  def new_game
    game = Hangman.new
    game.start_game
  end
end

game = Hangman.new
game.start_game
