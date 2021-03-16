require 'dxruby'

require_relative './src/player/player'

player = Player_base.new

Window.width = 800
Window.height = 600

Window.loop do
  player.draw
end
