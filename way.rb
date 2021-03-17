class Way < Sprite
  def initialize(x, y)
    way_image = Image.new(100, 100, C_WHITE)
    @speed = 5
    @obs_y = 400
    @obs_no = true
    super(x, y, way_image)
  end

  def update
    self.x -= @speed
    if self.x + 100 <= 0
      self.vanish
      # p self.x
    end
  end

  #衝突判定が起きたときの処理
  def hit_way(o)

  end
  def hit_obs(o)

  end

end

class Ways
  MAX_WAYS = 8

  def initialize
    @ways = []
    @obstacle = []
    @way_x = 0
    @count = 0
  end

  def update
    Sprite.update(@ways)
    Sprite.clean(@ways)
    Sprite.update(@obstacle)
    Sprite.clean(@obstacle)

    # puts "@obst size =  #{@obstacle.size}"
    (MAX_WAYS - @ways.size).times do
      @ways << Way.new(800 + 100 * -@way_x, 500)

      if rand(1..100) > 80
        @obstacle << Way.new(800, 400)
      end

      if @count == 0
        if @way_x <= MAX_WAYS
          @way_x += 1
        else
          @count = 1
          @way_x = 0
        end
      else
        @way_x = 0
      end
    end
  end

  def draw
    Sprite.draw(@ways)
    Sprite.draw(@obstacle)
  end

  def giv_arr_way
    @ways
  end
  def giv_arr_obs
    @obstacle
  end
end
