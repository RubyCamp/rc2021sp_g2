class Way < Sprite
  def initialize(x, y, width, height)
    way_image = Image.load("./images/way.png")
    way_image.set_color_key(C_WHITE)
    @speed = 5
    super(x, y, way_image)
  end

  def update
    self.x -= @speed
    if self.x + 100 <= 0
      self.vanish
    end
  end
end

class Ways
  attr_reader :ways, :obstacle
  MAX_WAYS = 8

  def initialize
    @ways = []
    @obstacle = []
    @way_x = 0
    @count = 0
    @cnt_obs   = 0
    @cnt_o_obs = 0
    @cnt_t_obs = 0
  end

  def update
    Sprite.update(@ways)
    Sprite.clean(@ways)
    Sprite.update(@obstacle)
    Sprite.clean(@obstacle)
    (MAX_WAYS - @ways.size).times do
      @ways << Way.new(800 + 100 * -@way_x, 500, 100, 100)

        if rand(1..100) > 80
          @obstacle << Way.new(800, 400, 100, 100)
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

  def getter
    @obstacle
  end
end
