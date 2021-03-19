class Wall < Sprite
    def initialize 
        @image =Image.load('images/virous.png')
        @image.set_color_key(C_WHITE)
    end

    def update
        10.times { |i| Window.draw(0, 60*i, @image) }
    end
end
