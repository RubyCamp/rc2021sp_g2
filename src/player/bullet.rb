class Bullet < Sprite
    def initialize(x,y)
        image = Image.new(100,20,C_WHITE)
        super(x,y,image)
        @speed = 5
    end

    def update
        self.x += @speed
        #self.y += @speed
        if self.x > 800
            self.vanish
        end
    end

    def shot
        self.vanish
    end
end

class Bullets
    MAX_BALLET = 5

    def initialize
        @box = []
    end

    def update(enemies)
        Sprite.check(@box, enemies)
        Sprite.update(@box)
        Sprite.clean(@box)

        if Input.key_push?(K_SPACE) && @box.size < MAX_BALLET
            @box << Bullet.new($x, $y)
        end
        #  p @box.size
    end

    def draw
        Sprite.draw(@box)
    end
end