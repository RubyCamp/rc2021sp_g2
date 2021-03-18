class Op

    GAME_INFO = {
        scene: :title,
        score: 0,
    }

    def initialize
        reset
    end

    def reset
        @bgm = Sound.new("./sro/bgm/umi.mid")
        @ways = Ways.new
        @enemies = Enemies.new
        @plyr = Player.new
        GAME_INFO[:scene]=:title
    end

    def run
        Window.loop do
            case GAME_INFO[:scene]
            when :title 
                image=Image.load("./sro/images/op.png")
                font=Font.new(32)
                @bgm.play
                Window.draw(100,100,image)
                Window.draw_font(500,300,"STARAT:SPACE",font)
                Window.draw_font(500,100,"TITLE",font)
                if Input.key_push?(K_SPACE)
                    GAME_INFO[:scene] = :playing
                end

                
            when :playing
                @ways.update
                @ways.draw
                @plyr.update
                @plyr.jump
                @plyr.draw
                @enemies.update
                @enemies.draw
                # if GAME_INFO[:score] >= 10
                #     GAME_INFO[:scene] = :clear
                # end
                if Input.key_push?(K_SPACE)
                    GAME_INFO[:scene] = :game_over
                end           

            when :game_over
                image=Image.load("./sro/images/ed2.png")
                font=Font.new(32)
                Window.draw(100,100,image)
                Window.draw_font(500,300,"Game Over",font)
                Window.draw_font(500,400,"RETRY:SPACE",font)
                if Input.key_push?(K_SPACE)
                    #GAME_INFO[:score] = 0
                    GAME_INFO[:scene] = :clear
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