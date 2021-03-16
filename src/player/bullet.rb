class Bullet < Sprite
    def initialize(x,y)
        @speed = 5
        image = Image.new(100,100,C_WHITE)
        super(x,y,image)
    end

    def update
        self.x += @speed
    end

end