require 'dxruby'

require_relative 'way'
require_relative 'enemy'
require_relative 'player'

Window.width  = 800
Window.height = 600

plyr = Player.new
ways = Ways.new
enemies = Enemies.new


Window.loop do
  Sprite.check(plyr, ways.giv_arr_way,shot=:shot_way,hit=:hit_way)
  Sprite.check(plyr, ways.giv_arr_obs,shot=:shot_obs,hit=:hit_obs)
  ways.update
  ways.draw
  plyr.update
  plyr.jump
  plyr.draw
  enemies.update
  enemies.draw
end
