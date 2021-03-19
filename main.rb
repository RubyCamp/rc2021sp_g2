require 'dxruby'

require_relative 'bullet'
require_relative 'system'
require_relative 'game'
require_relative 'way'
require_relative 'enemy'
require_relative 'wall'
require_relative 'player'
require_relative 'cloud'

Window.width  = 800
Window.height = 600
Window.bgcolor=[135,206,235]


Window.loop do
  game = Game.new
  game.run
end
