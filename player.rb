#プレイヤーの呼び出しと機能まとめ
class Player < Sprite
  #初期化
  def initialize
    #キャラクターの画像と座標
    @image = Image.load("./src/images/player.png")
    @image.set_color_key(C_WHITE)
    @x  = 20
    @y  = 490
    @dy = 0#y座標の増加量
    @speed = 5
    #キャラクターのSpriteに値を渡す
    self.x = @x
    self.y = @y
    self.image = @image

    @jump_flag = false#二段ジャンプ防止。
    @under = self.y + @image.height#足元をY座標に
  end

  #ジャンプの制御
  def jump
    if Input.key_push?(K_UP) && @jump_flag
      @dy = - 16
      @jump_flag = false
    end
    @under += @dy
    self.y = @under - @image.height
    @dy += 1 #重力的な
  end

  def update
    @speed_mag = 1.5
    if Input.key_down?(K_LEFT) && self.x > 100
      self.x -= @speed * @speed_mag
    elsif Input.key_down?(K_RIGHT) && self.x + @image.width < 800
      self.x += @speed
    end
  end

  #衝突判定が来たときにy座標を変更
  #1段目
  def shot_way(d)
    @under = d.y
    @dy = 0
    @jump_flag = true
  end
  #2段目
  def shot_obs(d)
    if @under - @dy < d.y #天板
      @under = d.y
      @dy = 0
      @jump_flag = true
    elsif d.x > self.x #障害物左辺
      self.x = d.x - @image.width
    elsif d.x + 100 < self.x + 3 #障害物右辺
      self.x += @speed
    end

  end

end
