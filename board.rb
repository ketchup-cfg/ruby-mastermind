# frozen_string_literal: true

# The board containing the pegs that have been placed
class Board
  attr_reader :spaces

  def initialize
    @spaces = []
  end

  def board_is_full?
    spaces.length >= 12
  end

  def add_row(row)
    @spaces << row unless board_is_full?
  end

  def clear
    @spaces = []
  end

  def display
    spaces.each do |row|
      puts "#{row[0]} #{row[1]} #{row[2]} #{row[3]}"
    end
  end
end
