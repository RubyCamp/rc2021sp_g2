class Op
    def initialize
        reset
    end

    def reset
        # @bgm = Sound.new("./sro/bgm/umi.mid")
        @ways = Ways.new
        @enemies = Enemies.new
        @plyr = Player.new
        @wall = Wall.new
        @bullets = Bullets.new
        @clouds = Clouds.new
        @system = System.new
    end

    def run
        Window.loop do
            case @system.getScene
            when :title 
                image=Image.load("./sro/images/op.png")
                font=Font.new(32)
                # @bgm.play
                Window.draw(100,100,image)
                Window.draw_font(500,300,"STARAT:SPACE",font)
                Window.draw_font(500,100,"TITLE",font)
                if Input.key_push?(K_ESCAPE)
                    @system.scene = :playing
                end

                
            when :playing
                Sprite.check(@plyr, @ways.ways,shot=:shot_way,hit=:hit_way)
                Sprite.check(@plyr, @ways.obstacle,shot=:shot_obs,hit=:hit_obs)
                @enemies.update
                @enemies.draw
                @ways.update
                @ways.draw
                @plyr.update
                @plyr.jump
                @plyr.draw
                @bullets.update(@enemies.getter,@ways.getter)
                @bullets.draw
                @clouds.update(@plyr)
                @clouds.draw
                @wall.update
                @wall.draw
                @system.update
                if Input.key_push?(K_ESCAPE)
                    @system.scene = :game_over
                end           

            when :game_over
                image=Image.load("./sro/images/ed2.png")
                font=Font.new(32)
                Window.draw(100,100,image)
                Window.draw_font(500,300,"Game Over",font)
                Window.draw_font(500,400,"RETRY:SPACE",font)
                if Input.key_push?(K_ESCAPE) 
                    @system.scene = :clear
                    #reset
                end
            when  :clear
                image=Image.load("./sro/images/ed1.png")
                font=Font.new(32)
                Window.draw(100,100,image)
                Window.draw_font(500,300,"Clear",font)
                Window.draw_font(500,400,"RETRY:ESCAPE",font)
                if Input.key_push?(K_ESCAPE)
                    reset    
                end
            end
        end
    end
end