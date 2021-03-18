require 'dxruby'

require_relative 'bullet'
require_relative 'way'
require_relative 'enemy'
require_relative 'wall'
require_relative 'player'
require_relative 'cloud'

Window.width  = 800
Window.height = 600
Window.bgcolor=[135,206,235]

plyr = Player.new
ways = Ways.new
enemies = Enemies.new
wall = Wall.new
bullets = Bullets.new
clouds = Clouds.new

def bg
  bg = Image.load("images/bg.png")
  bg.set_color_key(C_WHITE)
end
Window.loop do
  Window.draw(0,150,bg)
  Sprite.check(plyr, ways.ways,shot=:shot_way,hit=:hit_way)
  Sprite.check(plyr, ways.obstacle,shot=:shot_obs,hit=:hit_obs)
  ways.update
  ways.draw
  enemies.update
  enemies.draw
  wall.update
  wall.draw
  bullets.update(enemies.enemies,ways.obstacle)
  bullets.draw
  plyr.update
  plyr.draw
  clouds.update(plyr)
  clouds.draw
end
