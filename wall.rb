class Wall < Sprite
    def initialize 
        @image = Image.new(100,600,C_WHITE)
        @image.box_fill(0,0,100,600,C_WHITE)
    end
    
    def update
        Window.draw(0,0,@image)  
    end
end

