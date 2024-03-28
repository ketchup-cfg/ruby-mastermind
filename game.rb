# frozen_string_literal: true

require_relative 'board'
require_relative 'peg'

# The object to hold the game state and actions
class Game
  attr_reader :board, :code

  def initialize
    reset
  end

  def reset
    @board = Board.new
    @code = []
  end

  def set_code
    4.times do
      @code << [Peg.green, Peg.red, Peg.blue, Peg.yellow, Peg.white].sample
    end
  end

  def play
    set_code
    puts code.join('')
  end
end
