require 'dxruby'

require_relative 'way'
require_relative 'enemy'
require_relative './src/player'
require_relative 'wall'

Window.width = 800
Window.height = 600

ways = Ways.new
enemies = Enemies.new
plyr = Player.new
wall = Wall.new

Window.loop do 
  ways.update
  ways.draw
  enemies.update
  enemies.draw
  wall.update
  wall.draw
  plyr.update
  plyr.jump
  plyr.draw
end
