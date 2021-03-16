require 'dxruby'

require_relative 'enemy'

Window.width = 800
Window.height = 600

enemies = Enemies.new

Window.loop do
  enemies.update
  enemies.draw
end