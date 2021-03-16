require 'dxruby'

require_relative 'way'
require_relative 'enemy'
require_relative './src/player'

Window.width = 800
Window.height = 600

ways = Ways.new
enemies = Enemies.new
plyr = Player.new

Window.loop do 

  ways.update
  ways.draw
  plyr.update
  plyr.jump
  plyr.draw
  enemies.update
  enemies.draw
end
