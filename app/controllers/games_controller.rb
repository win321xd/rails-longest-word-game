require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = [*'A'..'Z'].sample(10)
  end

  def score

  end

  def eligible?(word)
    @guess = word.to_a
    @guess.each_with_index do |index|
      @letters.include?(@guess[index])
      raise
    end
  end

  def english?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
