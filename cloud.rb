class Cloud < Sprite
    def initialize(x)
        @speed = 8
        image =Image.load('images/kumo.png')
        image.set_color_key(C_GREEN)
        y = 15r
        super(x,y,image)
    end

    def update
        self.x -= @speed
        if self.x + 60 < 0
            self.vanish
        end
    end

    def shot
        puts "hit!"
    end
end

class Clouds

    MAX_CLOUD = 4

    def initialize
        @clouds = []
    end

    def update(plyr)
        Sprite.check(@clouds, plyr)
        Sprite.update(@clouds)
        Sprite.clean(@clouds)
        (MAX_CLOUD - @clouds.size).times do
          if rand(1..100) > 80
            @clouds << Cloud.new(800)
          end
        end
    end

    def draw
        Sprite.draw(@clouds)
    end
end
