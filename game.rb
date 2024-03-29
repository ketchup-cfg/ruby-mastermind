# frozen_string_literal: true

require_relative 'board'
require_relative 'peg'

# The object to hold the game state and actions
class Game
  attr_reader :board, :code

  VALID_COLORS = [Peg.green, Peg.red, Peg.blue, Peg.yellow, Peg.white, Peg.magenta].freeze

  def initialize
    reset
  end

  def reset
    @board = Board.new
    @code = []
  end

  def set_code
    4.times do
      @code << VALID_COLORS.sample
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

  def hints(guesses)
    guesses.map.with_index do |guess, i|
      if guess == code[i]
        Peg.green
      elsif code.include?(guess)
        Peg.yellow
      else
        Peg.default
      end
    end
  end

  def guess
    guesses = []
    valid = false

    until valid
      print 'Please enter your guess, with each color seperated by spaces: '
      guesses = gets.chomp.downcase.split.map { |guess| Peg.translate(guess[0]) }

      valid = guesses_valid?(guesses)
    end

    board.add_row(guesses, hints(guesses))
    board.display
    puts code.join('')
  end

  def play
    set_code
    guess
  end
end
