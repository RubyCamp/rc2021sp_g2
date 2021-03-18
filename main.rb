require 'dxruby'

require_relative './sro/op'
require_relative 'way'
require_relative 'enemy'
require_relative './src/player'

Window.width = 800
Window.height = 600

Window.loop do
  op=Op.new
  op.run
end
