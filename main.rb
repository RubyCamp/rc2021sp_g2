require 'dxruby'
require_relative 'wall'
Window.width = 800
Window.height = 600
#image.new(100,600,C_WHITE)
#imgage = Image.new(100, 600, C_WHITE)
#s = Sprite.new(100,600, Image)
#m = Sprite.new(0,0, Image)
#front = Front.new(32)
#img1.box_fill(0,0,100,600,C_WHITE)
wall = Wall.new
Window.loop do
#    m.x, m.y = Input.mouse_pos_x, Input.mouse_pos_y

#    s.draw
#   m.draw
  
#    if m === s
#      Window.draw_font(0, 0, "hit!", font)
#    end
#Window.draw(0,0,img1)  
wall.update
wall.draw
end