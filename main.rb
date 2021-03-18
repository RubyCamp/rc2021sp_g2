require 'dxruby'

require_relative 'bullet'
require_relative './sro/op'
require_relative 'way'
require_relative 'enemy'
require_relative 'wall'
require_relative 'player'
require_relative 'cloud'

Window.width  = 800
Window.height = 600

Window.loop do
  op=Op.new
  op.run
end
