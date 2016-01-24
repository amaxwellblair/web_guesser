require 'sinatra'
require 'sinatra/reloader'

RANDOM_NUMBER = rand(0..100)
output = ""
get '/' do
    output = guesswork(params['guess'])
    erb :index, :locals => {:random_number => RANDOM_NUMBER, :output => output}
end

def guesswork(guess)
  if guess.to_i == RANDOM_NUMBER
    output = "You win! The secret number is #{RANDOM_NUMBER}"
  elsif guess.to_i > RANDOM_NUMBER
    output = "Too high"
  elsif guess.to_i < RANDOM_NUMBER
    output = "Too low"
  end
  return output
end
