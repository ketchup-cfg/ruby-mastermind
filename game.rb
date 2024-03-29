# frozen_string_literal: true

require_relative 'board'
require_relative 'peg'

# The object to hold the game state and actions
class Game
  attr_reader :board, :code

  VALID_COLORS = %w[r g b y w m].freeze

  def initialize
    reset
  end

  def reset
    @board = Board.new
    @code = []
  end

  def set_code
    4.times do
      @code << [Peg.green, Peg.red, Peg.blue, Peg.yellow, Peg.white, Peg.magenta].sample
    end
  end

  def guesses_valid?(guesses)
    if guesses.length != 4
      puts 'Please only enter 4 colors, seperated by spaces'
      false
    elsif guesses.any? { |guess| !VALID_COLORS.include?(guess) }
      puts 'Please only enter valid colors'
      puts 'Valid colors are: (r)ed, (g)reen, (b)lue, (y)ellow, (w)hite), (m)agenta'
      false
    else
      true
    end
  end

  def guess
    guesses = []
    valid = false

    until valid
      print 'Please enter your guess, with each color seperated by spaces: '
      guesses = gets.chomp.downcase.split.map { |guess| guess[0] }

      valid = guesses_valid?(guesses)
    end

    p guesses
  end

  def play
    set_code
    guess
  end
end
