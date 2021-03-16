class Way < Sprite
  def initialize(x)
    y = 500
    way_image = Image.new(100, 100, C_WHITE)
    @speed = 5
    super(x, y, way_image)
  end

  def update
    self.x -= @speed
    if self.x + 100 <= 0
      self.vanish
      p self.x
    end
  end
end

class Ways
  MAX_WAYS = 10

  def initialize
    @ways = []
    @way_x = 0
    @count = 0
  end

  def update
    Sprite.update(@ways)
    Sprite.clean(@ways)

    puts "@ways size =  #{@ways.size}"
    (MAX_WAYS - @ways.size).times do
      @ways << Way.new(800 + 100 * -@way_x)
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
  end
end