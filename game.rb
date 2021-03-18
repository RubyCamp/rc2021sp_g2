class Game
  def initialize
    reset
  end

  def reset
    @image_opening = Image.load("images/op.png")
    @image_gameover = Image.load("images/ed2.png")
    @image_clear = Image.load("images/ed1.png")
    @font = Font.new(32)
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
        Window.draw(100, 100, @image_opening)
        Window.draw_font(500, 300, "STARAT:SPACE", @font)
        Window.draw_font(500, 100, "TITLE", @font)
        if Input.key_push?(K_SPACE)
          @system.scene = :playing
        end
      when :playing
        Sprite.check(@plyr, @ways.ways, shot=:shot_way, hit=:hit_way)
        Sprite.check(@plyr, @ways.obstacle, shot=:shot_obs, hit=:hit_obs)
        Sprite.check(@plyr, @enemies, hit=:hit_ene)
        @enemies.update(@plyr)
        @enemies.draw
        @ways.update
        @ways.draw
        @plyr.update
        @plyr.jump
        @plyr.draw
        @bullets.update(@enemies.getter, @ways.getter)
        @bullets.draw
        @clouds.update(@plyr)
        @clouds.draw
        @wall.update
        @wall.draw
        @system.update
        if $score == 10
          @system.scene = :clear
        elsif $life == 0 || @plyr.getFlag == 1
          @system.scene = :game_over
        end           
      when :game_over
        Window.draw(100, 100, @image_gameover)
        Window.draw_font(500, 300, "Game Over", @font)
        Window.draw_font(500, 400, "RETRY:SPACE", @font)
        if Input.key_push?(K_ESCAPE) 
          @system.scene = :clear
          reset
        end
      when  :clear
        Window.draw(100, 100, @image_clear)
        Window.draw_font(500, 300, "Clear", @font)
        Window.draw_font(500, 400, "RETRY:ESCAPE", @font)
        if Input.key_push?(K_ESCAPE)
          reset    
        end
      end
    end
  end
end
