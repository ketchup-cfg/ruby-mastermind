# frozen_string_literal: true

# The board containing the pegs that have been placed
class Board
  attr_reader :spaces, :hints

  def initialize
    @spaces = []
    @hints = []
  end

  def board_is_full?
    spaces.length >= 12
  end

  def add_row(row, hint)
    @spaces << row unless board_is_full?
    add_hint(hint)
  end

  def clear
    @spaces = []
    @hints = []
  end

  def display
    spaces.each_with_index do |row, i|
      puts "#{row[0]} #{row[1]} #{row[2]} #{row[3]} | #{hints[i].join('')}"
    end
  end

  private

  def add_hint(hint)
    @hints << hint unless board_is_full?
  end
end
