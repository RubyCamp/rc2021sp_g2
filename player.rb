# プレイヤーの呼び出しと機能まとめ
class Player < Sprite

  # 初期化
  def initialize
    # キャラクターの画像と座標
    @image = Image.load("images/player.png")
    @image.set_color_key(C_WHITE)
    @x  = 20
    @y  = 490
    @dy = 0 # y座標の増加量
    @speed = 5

    # キャラクターのSpriteに値を渡す
    self.x = @x
    self.y = @y
    self.image = @image

    @jump_flag = false
    @under = self.y + 81 # 足元をY座標に
  end

  def jump
    if Input.key_push?(K_UP) and @jump_flag
      @dy = - 18
      @jump_flag = false
    end
    @under += @dy
    self.y = @under -81
    @dy += 1 # 重力的な
  end

  def update
    @speed = 5

    if Input.key_down?(K_LEFT) && self.x > 100
      self.x -= @speed
    elsif Input.key_down?(K_RIGHT) && self.x + 47 < 800
      self.x += @speed
    end
  end

  # 衝突判定が来たときにy座標を変更
  def shot_way(d)
    way_y = d.y
    @under = way_y
    @dy = 0
    @jump_flag = true
    @under
  end

  def shot_obs(d)
    obs_x = d.x
    obs_y = d.y
    obj_id = d.object_id
    
    if @under - @dy < obs_y
      @under = obs_y
      @dy = 0
      @jump_flag = true
    end
  end
end
