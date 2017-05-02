require 'sinatra'
require 'sinatra/reloader'
set :secret => rand(10)
@@guesses = 5

get '/' do
  new_number if @@guesses == 0
  guess = params['guess']
  cheat = params["cheat"]
  cheat = cheat ? "<p>Cheat mode activated! The secret number is #{settings.secret}!</p>" : ""
  message = check_guess(guess)
  erb :index, locals: { message: message, cheat: cheat }
end

def check_guess(guess)
  case
  when @@guesses == 1
    @@guesses = 0
    return "You haven't been able to find the number. It was #{settings.secret }, resetting!"
  when guess.to_i == 0 then ""
  when guess.to_i > settings.secret
    return "<p class='high'>You guessed too high. #{@@guesses -= 1} guesses left!</p>"
  when guess.to_i < settings.secret
    return "<p class='low'>You guessed too low.#{@@guesses -= 1} guesses left!</p>"
  when guess.to_i == settings.secret
    new_number
    return "<p class='correct'>You guessed correctly! Setting new number!</p>";
  end
end

def new_number
  settings.secret = rand(10)
  @@guesses = 5
end
