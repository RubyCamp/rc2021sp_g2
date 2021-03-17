#プレイヤーの呼び出しと機能まとめ
class Player < Sprite

  #キャラクターの画像と座標
  @@image = Image.load("./src/images/player.png")
  @@image.set_color_key(C_WHITE)  #初期化
  def initialize
    @x = 20
    @y = 490
    @dy = 0#y座標の増加量
    @under = self.y + 81#足元をY座標に
    @speed = 10
    super
    #キャラクターのSpriteに値を渡す
    self.x = @x
    self.y = @y
    self.image = @@image
  end

  #ジャンプメソッド
  def jump
    if @dy == 0
      @dy = -15 if Input.key_push?(K_UP)
      @under += @dy
      if(@under >= 501)#仮の足場で画面外に出ないように
        @under = 500
        @dy = 0
      end
      self.y = @under -81
      @dy += 1 #重力的な
    end
  end

  def update
    if Input.key_down?(K_LEFT) && self.x > 100
      self.x -= 5
    elsif Input.key_down?(K_RIGHT) && self.x + 47 < 800
      self.x += 5
    end
  end

end
