require 'dxruby'


require_relative './src/player/bullet'



Window.width = 800
Window.height = 600
bullet = Bullet.new(40,300)
Window.loop do

  bullet.update
  bullet.draw
end
