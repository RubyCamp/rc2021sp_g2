require 'dxruby'

require_relative './src/player'

plyr = Player.new

Window.width = 800
Window.height = 600

Window.loop do
  plyr.jump
  plyr.draw
end
