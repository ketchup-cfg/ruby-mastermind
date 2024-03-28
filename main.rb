# frozen_string_literal: true

require_relative 'game'

def start
  game = Game.new
  game.play
end

start
