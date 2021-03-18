require 'dxruby'

require_relative 'way'
require_relative 'enemy'
require_relative './src/player'
require_relative 'wall'
require_relative 'cloud'

Window.width = 800
Window.height = 600

ways = Ways.new
enemies = Enemies.new
plyr = Player.new
wall = Wall.new
clouds = Clouds.new

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
  clouds.update(plyr)
  clouds.draw
  # plyr.check(cloud.getSprite)
  # => [] 配列の長さ（要素数）が0
  # => [sprite1, sprite2].size 配列の長さ（要素数）が2
  # if plyr.check(cloud.getSprite).size != 0
  #   cloud.shot
  # end
end
