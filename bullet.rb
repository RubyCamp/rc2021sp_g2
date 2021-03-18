class Bullet < Sprite
    def initialize(x,y)
        bullet = Image.load("./images/syringe.png")
        bullet.set_color_key(C_BLACK)
        super(x,y,bullet)
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
  attr_reader :box
    MAX_BALLET = 5

    def initialize
        @box = []
    end

    def update(enemies,ways)
        Sprite.check(@box,enemies)
        Sprite.check(@box,ways)

        Sprite.update(@box)
        Sprite.clean(@box)

        if Input.key_push?(K_SPACE) && @box.size < MAX_BALLET
            @box << Bullet.new($x, $y)
        end
    end

    def draw
        Sprite.draw(@box)
    end
end
