require 'dxruby'

require_relative 'way'
require_relative 'enemy'
require_relative './src/player'

plyr = Player.new

Window.width = 800
Window.height = 600


ways = Ways.new
enemies = Enemies.new

Window.loop do
  ways.update
  ways.draw
  plyr.jump
  plyr.draw
  enemies.update
  enemies.draw
end
