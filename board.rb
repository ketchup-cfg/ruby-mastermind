# frozen_string_literal: true

# The board containing the pegs that have been placed
class Board
  attr_reader :guesses, :hints

  def initialize
    @guesses = []
    @hints = []
  end

  def board_is_full?
    guesses.length >= 12
  end

  def add_row(guess, hint)
    @guesses << guess unless board_is_full?
    add_hint(hint)
  end

  def clear
    @guesses = []
    @hints = []
  end

  def display
    guesses.each_with_index do |guess, i|
      puts "#{guess[0]} #{guess[1]} #{guess[2]} #{guess[3]} | #{hints[i].join('')}"
    end
  end

  private

  def add_hint(hint)
    @hints << hint unless board_is_full?
  end
end
