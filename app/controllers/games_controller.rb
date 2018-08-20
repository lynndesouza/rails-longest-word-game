require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word].upcase
    raise
    if @word.include?(@letters)
      "Congratulations! #{@word} is a valid word."
    else
      "Sorry but #{@word} can't be built out of #{@letters}."
    end
  end

  private
  def validate_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
