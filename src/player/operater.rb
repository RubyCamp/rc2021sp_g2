#プレイヤーの呼び出しと機能まとめ
class Operate < Sprite

  def initialize
    @image = Image.load("./src/player/images/player.png")
    @image.set_color_key(C_WHITE)
    @x = 40
    @y = 40
    @speed = 1
  end

  def update
  @x+=Input.x*@speed
  end


  def draw
    Window.draw(@x, @y, @image)
  end
end
