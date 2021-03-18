require 'dxruby'


require_relative './src/player/bullet'
require_relative 'way'
require_relative 'enemy'
require_relative 'wall'
require_relative 'player'
require_relative 'cloud'

Window.width  = 800
Window.height = 600

plyr = Player.new
ways = Ways.new
enemies = Enemies.new
wall = Wall.new
bullets = Bullets.new
clouds = Clouds.new

Window.loop do
  Sprite.check(plyr, ways.ways,shot=:shot_way,hit=:hit_way)
  Sprite.check(plyr, ways.obstacle,shot=:shot_obs,hit=:hit_obs)
  ways.update
  ways.draw
  enemies.update
  enemies.draw
  wall.update
  wall.draw
  bullets.update(enemies.getter,ways.getter)
  bullets.draw
  plyr.update
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
