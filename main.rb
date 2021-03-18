require 'dxruby'

require_relative 'way'
require_relative 'enemy'
require_relative 'wall'
require_relative 'player'

Window.width  = 800
Window.height = 600

plyr = Player.new
ways = Ways.new
enemies = Enemies.new
wall = Wall.new

Window.loop do
  Sprite.check(plyr, ways.ways,shot=:shot_way,hit=:hit_way)
  Sprite.check(plyr, ways.obstacle,shot=:shot_obs,hit=:hit_obs)
  ways.update
  ways.draw
  enemies.update
  enemies.draw
  wall.update
  wall.draw
  plyr.update
  plyr.draw
end
