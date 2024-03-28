# frozen_string_literal: true

# The board containing the pegs that have been placed
class Board
  attr_reader :spaces, :guesses

  def initialize
    @spaces = []
    @guesses = []
  end

  def board_is_full?
    spaces.length >= 12
  end

  def add_row(row)
    @spaces << row unless board_is_full?
  end

  def add_guess(guess)
    @guesses << guess unless board_is_full?
  end

  def clear
    @spaces = []
    @guesses = []
  end

  def display
    spaces.each_with_index do |row, i|
      puts "#{row[0]} #{row[1]} #{row[2]} #{row[3]} | #{guesses[i]}"
    end
  end
end
