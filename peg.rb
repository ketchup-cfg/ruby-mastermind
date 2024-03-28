# frozen_string_literal: true

# Pegs with colors that should get displayed in the terminal
class Peg
  def self.colorize(color)
    "\e[#{color}mO\e[0m"
  end

  def self.green
    colorize(32)
  end

  def self.red
    colorize(31)
  end

  def self.blue
    colorize(34)
  end

  def self.yellow
    colorize(33)
  end

  def self.white
    colorize(97)
  end

  def self.magenta
    colorize(35)
  end
end
