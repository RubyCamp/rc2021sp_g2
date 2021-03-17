class Wall < Sprite
    def initialize 
        #@image = Image.new(100,600,C_WHITE)
        #@image.box_fill(0,0,100,600,C_WHITE)
        #@image =Image.load('virous.png')
        @image =Image.load('images/virous.png')
        @image.set_color_key(C_WHITE)
        
    end
    
    def update
        Window.draw(0,0,@image) 
        Window.draw(0,60,@image) 
        Window.draw(0,120,@image) 
        Window.draw(0,180,@image) 
        Window.draw(0,240,@image) 
        Window.draw(0,300,@image) 
        Window.draw(0,360,@image) 
        Window.draw(0,420,@image) 
        Window.draw(0,480,@image) 
    end
end
