require 'sinatra'
require 'sinatra/reloader'

RANDOM_NUMBER = rand(0..100)
output = ""
get '/' do
    output = guesswork(params['guess'])
    output += "<br/>You dirty cheater the secret number is: " + RANDOM_NUMBER.to_s if params['cheat'] == 'true'
    erb :index, :locals => {:random_number => RANDOM_NUMBER, :output => output}
end

def guesswork(guess)
  if guess.to_i == RANDOM_NUMBER
    "You win! The secret number is #{RANDOM_NUMBER}"
  elsif guess.to_i > RANDOM_NUMBER
    if guess.to_i - RANDOM_NUMBER > 5
      "Way too high"
    else
      "Too high"
    end
  elsif guess.to_i < RANDOM_NUMBER
    if guess.to_i - RANDOM_NUMBER < -5
      "Way too low"
    else
      "Too low"
    end
  end
end
