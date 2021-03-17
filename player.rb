#プレイヤーの呼び出しと機能まとめ
class Player < Sprite


  #初期化
  def initialize
    #キャラクターの画像と座標
    @image = Image.load("./src/images/player.png")
    @image.set_color_key(C_WHITE)
    @x = 20
    @y = 490
    @dy = 0#y座標の増加量
    @under = self.y + 81#足元をY座標に
    super
    #キャラクターのSpriteに値を渡す
    self.x = @x
    self.y = @y
    self.image = @image
  end

  def jump
    @dy = -15 if Input.key_push?(K_UP)
    @under += @dy
    self.y = @under -81
    @dy += 1 #重力的な
  end

  #当たり判定が来たときにy座標を変更
  def shot
    @under = $coll_y
    @dy = 0
  end
end
