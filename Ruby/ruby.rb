# ASK NAME
puts ""
puts "NAME ASK EXERCICE"
puts ""

puts "Hey, I'm Neo. What is your first name?"
first_name = gets.chomp
puts "Alright, #{first_name} it is. And what's your last name?"
last_name = gets.chomp
puts "#{first_name} #{last_name} eh? Never heard of that one before stranger."
puts "Oh wait... I remember! #{first_name} Johnson #{last_name}, right?"

answer = gets.chomp

if answer.upcase == "YES"
	puts "Exactly, #{first_name} Johnson #{last_name} it was!"
else 
	puts "Not? Than what was your middle name again?"
	middle_name = gets.chomp
end
puts "Alright, I get it now. It's #{first_name} #{middle_name} #{last_name}! Silly me :)"
puts ""

puts "FAVORITE NUMBER EXERCISE"
puts
puts "So, #{first_name} #{last_name}, do you have a favorite number in mind you puny mortal?"

favorite_number = gets.chomp.to_i

if favorite_number < 100
	puts "Muahahahaha, #{favorite_number}? What a puny little number is that! Only weaklings choose a number like that. Let's see... . What about "+ (favorite_number.to_i + 1).to_s + "? Yes, that's a force to be reconned with."
else 
	puts "Meh, I suppose that's ok"
end
puts "" 

puts "DISCUSSION BOSS EXCERCICE"
puts ""

puts "You're having a discussion with your boss and you'd like to ask for a working agreement/raise/childcare support. What would you like to ask your boss?"
answer = gets.chomp
puts answer.upcase + "???!!!! WHAAAAAT? ARE YOU KIDDING ME? YOU LAZY PIG, YOU'RE FIRED!!!"
puts ""

puts "TABLE OF CONTENTS EXERCISE"
puts ""

lineWidth = 50 
puts ("Table Of Contents".center(lineWidth))
puts ""
puts ("Chapter 1: Numbers".ljust(lineWidth/2)) + ("page 1".rjust(lineWidth/2))
puts ("Chapter 2: Letters".ljust(lineWidth/2)) + ("page 72".rjust(lineWidth/2))
puts ("Chapter 3: Variables".ljust(lineWidth/2)) + ("page 118".rjust(lineWidth/2))
puts ""

puts "DEAF GRANDMA EXCERCICE"
puts ""

puts "You're in a conversation with your deaf grandma. (You might have to shout in All-CAPS"
puts "Grandma: Hey Sonny, how are you doing?" 
answer = gets.chomp
while answer != "BYE!"
		if answer == answer.upcase
		puts "Grandma: NOT SINCE " + rand(1930..1950).to_s + " SONNY!!!"
	elsif answer != answer.upcase
		puts "Grandma: TALK LOUDER SONNY, GRANDMA CAN'T HEAR YOU!!!!!!"
end
puts "Grandma: WHAT ARE YOU HERE FOR?!!!!!!!"
answer = gets.chomp
end
puts "Grandma: Bye Sonny, You shouldn't shout to your grandma like that though"
puts ""

puts "LEAP YEAR EXERCICE"
puts ""

puts "In this exercise we're going to calculate all the leap years between two given years. Write down two different years;"
puts "YEAR ONE = "
one = gets.chomp.to_i
puts "YEAR TWO = "
two = gets.chomp.to_i

puts ""
puts "The leap years between " + one.to_s + " and " + two.to_s + " are:"
puts ""

years = []
while one < two 
	years.push(one += 1)
end

for x in years.each
	if x % 4 == 0 and x % 100 != 0
	puts x
end
end
puts

puts "WRITING EXERCISE" 
puts
puts "In this exercise you'll write words until you press enter, the computer will alphabetically sort these and repeat them back to you." 
puts
puts "What are your words?" 
puts

answers = []
input = ' '
while input != ''
 input = gets.chomp
 answers.push(input)
end

puts answers.each.sort
puts

puts "NUMBER EXERCISE" 
puts
puts "In this exercise we'll design a method that converts integers numbers to strings and spits them back out"  
puts

def englishNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left  = number
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

input = " "
while input != ""
input = gets.chomp
puts englishNumber(input.to_i)
puts
end
puts
	
# TIME EXERCISES 
puts "AGE/TIME EXERCICE"
puts
puts "In this exercise we'll calculate your age and SPANK! you for each birthday"
puts

def counter
puts "Year?"
year = gets.chomp.to_i
puts "Month?"
month = gets.chomp.to_i
puts "Day?"
day = gets.chomp.to_i

ageS = Time.new - Time.mktime(year, month, day)

age = ageS/60/60/24/365
age = age.to_i

puts "You are " + age.to_s + " years old!"

age.to_i
	x = 0
	while x < age
		puts "SPANK!"
		puts
		x += 1
	end
end

counter
puts

puts "MAKING CLASSES & HASHES"
puts

class Die
	def initialize
		roll
	end

def roll
	@numb = 1 + rand(6)
end

def number
	puts @numb
end

def cheat
	@numb = gets.chomp.to_i
	puts @numb
end 
end

die = Die.new
puts die.number
die.cheat
puts

puts "MAKING YOUR PET DRAGON"
puts
puts "In this exercise we're going to create you very own pet dragon and see how it goes!"
puts

class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.

    puts @name + ' is born.'
  end

  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  private

  # "private" means that the methods defined here are
  # methods internal to the object.  (You can feed
  # your dragon, but you can't ask him if he's hungry.)

  def hungry?
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else 
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  # This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end

end

pet = Dragon.new 'Norbert'
pet.feed
pet.walk
pet.putToBed
pet.putToBed
pet.putToBed
pet.putToBed
pet.putToBed
puts

puts "ORANGE TREE"
puts
puts "In this exercise we're going to create an orange tree that grows every year and that we can pick, count the oranges, eat, water and so-on"
puts

class OrangeTree

	def initialize
		@height = 1.5
		@oranges = 0
		@age = 0
		@picked = 0
		@water = 0
	end

	def pick amount
		puts "You attempt to pick " + amount.to_s + " oranges"
	if amount <= @oranges and @oranges != 0
		puts "You succesfully picked " + amount.to_s + " oranges!"
		@oranges = @oranges - amount 
		@picked = @picked + amount	
	else
		puts "There aren't enough oranges on the tree but you pick all you can."
		puts "You're able to pick " + @oranges.to_s + " oranges."
		@picked = @picked + @oranges
		@oranges = 0

	end
	puts
	end

	def count
		puts "You count the oranges on the tree, there's " + @oranges.to_s + " oranges."
puts	
	end

	def grow
		puts " A year passes.."
	 	if @age >= 2
		@oranges = @oranges + 7
		end
		if @age < 9
			@age = @age + 1
			if @water == 1
				@water = 0
			puts "Your tree grew! It now is " + @age.to_s + " years old, " + @height.to_s + " meters tall and contains " + @oranges.to_s + " oranges! You've " + @picked.to_s + " oranges left to be eaten."
			else
			puts "Your tree didn't grow though! The soil is looking kind of dry :s. Better fix that!"
		end
		else 
	   puts "Your tree has now reached the ripe age of 10. It's dead now."
	   exit
	end
	puts
	end

	def eat 
		if @picked > 0
			puts "You're ogling the " + @picked.to_s + " oranges you've picked. You stuff them into your mouth all at once!"
			@picked.to_i.times do
				puts "Omnomnom"
			@picked = 0
			end
		else 
		puts "You have no oranges to be eaten."
	end	
end

	def water
		puts "You water the soil! It's looking healthy and moist again. That'll sure promote the growth of your tree!"
		@water = @water + 1
	end

tree = OrangeTree.new 
if OrangeTree.new
	puts "You've planted a new tree! You can 'pick'/'count'/'water'/'eat' the oranges or 'wait' to let the tree grow. What will you do?"
	puts
end

choice = gets.chomp.upcase

while @age != 10
	case choice
	    when "PICK"
	    	puts
			puts "How many oranges do you want to pick?"
			puts
			choice = gets.chomp.to_i
			tree.pick choice 
			puts
			puts "What will you do next? 'pick'/'count'/'water'/'eat'/'wait'"
			puts
			choice = gets.chomp.upcase
	    when "COUNT"
	        tree.count
			puts
			puts "What will you do next? 'pick'/'count'/'water'/'eat'/'wait'"
			puts
			choice = gets.chomp.upcase
	    when "EAT" 
	        tree.eat
			puts
			puts "What will you do next? 'pick'/'count'/'water'/'eat'/'wait'"
			puts
			choice = gets.chomp.upcase
	    when "WAIT"
	        tree.grow
			puts
			puts "What will you do next? 'pick'/'count'/'water'/'eat'/'wait'"
			puts
			choice = gets.chomp.upcase
	    when "WATER"
	    	tree.water
			puts
			puts "What will you do next? 'pick'/'count'/'water'/'eat'/'wait'"
			puts
			choice = gets.chomp.upcase
	    else
	        puts "That makes no sense"
			puts
			puts "What will you do next? 'pick'/'count'/'water'/'eat'/'wait'"
			puts
			choice = gets.chomp.upcase
		end
	end
end
puts



puts

def doUntilFalse object, procedure
  input  = object
  output = object

  while output
    input  = output
    output = procedure.call input
  end

  input
end

buildArrayOfSquares = Proc.new do |array|
  lastNumber = array.last
  if lastNumber <= 0
    false
  else
    array.pop                         # Take off the last number...
    array.push lastNumber*lastNumber  # ...and replace it with its square...
    array.push lastNumber-1           # ...followed by the next smaller number.
  end
end

puts doUntilFalse([5], buildArrayOfSquares).inspect
puts doUntilFalse('I\'m writing this at 3:00 am; someone knock me out!', alwaysFalse)
puts 

class Array
  def eachEven(&block)
    isEven = true

    self.each do |object|
      if isEven
        block.call object
      end

      isEven = (not isEven)  # Toggle from even to odd, or odd to even.
    end
  end
end

['apple', 'bad apple', 'cherry', 'durian'].eachEven do |fruit|
  puts 'Yum!  I just love '+fruit+' pies, don\'t you?'
end

# Remember, we are getting the even-numbered elements
# of the array, all of which happen to be odd numbers,
[1, 2, 3, 4, 5].eachEven do |oddBall|
  puts oddBall.to_s+' is NOT an even number!'
end
puts 
