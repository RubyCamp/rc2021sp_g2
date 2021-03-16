require 'dxruby'

require_relative 'way'

Window.width = 800
Window.height = 600

ways = Ways.new

Window.loop do
  ways.update
  ways.draw
end