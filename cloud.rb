class Cloud < Sprite
    def initialize(x)
        @speed = 8
        image =Image.load('images/kumo.png')
        image.set_color_key(C_GREEN)
        #super(x,y,image)
        #@cloud1 = Sprite.new(50,15,@image)
        #@cloud2 = Sprite.new(200,15,@image)
        #@cloud3 = Sprite.new(350,15,@image)
        #@cloud4 = Sprite.new(500,15,@image)
        #@cloud5 = Sprite.new(650,15,@image)
        y = 15r
        super(x,y,image)
        # @enemies << Enemy.new(800, @enemyPlace[rand(0..1)])
    end

    def update
        self.x -= @speed
        if self.x + 60 < 0
            self.vanish
        end
    end

    # def getSprite
    #     @clouds
    # end
    
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