require 'dxruby'

require_relative './src/player/operater'

operater = Operate.new

Window.width = 800
Window.height = 600

Window.loop do
  operater.update
  operater.draw
end
