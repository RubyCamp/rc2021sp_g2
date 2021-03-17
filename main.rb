require 'dxruby'


require_relative './src/player/bullet'



Window.width = 800
Window.height = 600
bullets = Bullets.new
Window.loop do

  bullets.update
  bullets.draw
end
