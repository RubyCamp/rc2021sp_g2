class Enemy < Sprite
  def initialize(x, y)
    @font = Font.new(32)
    @speed = 5
    image = Image.load("images/enemy.png")
    image.set_color_key(C_WHITE)
    super(x, y, image)
  end

  def update
    self.x -= @speed
    if self.x + 45 <= 0
      self.vanish
    end
  end

  def hit
    self.vanish
    $score += 1
  end

  def shot
    self.vanish
    $life -= 1
  end

  def obs_ene
    self.vanish
  end
end

class Enemies
  attr_reader :enemies
  MAX_ENEMY = 5

  def initialize
    @enemies = []
    @enemyPlace = [330, 430]
  end

  def update(plyr)
    Sprite.update(@enemies)
    Sprite.clean(@enemies)
    Sprite.check(@enemies, plyr)

    (MAX_ENEMY - @enemies.size).times do
      if rand(1..100) > 99
        @enemies << Enemy.new(800, @enemyPlace[rand(0..1)])
      end
    end
  end

  def draw
    Sprite.draw(@enemies)
  end

  def getter
    @enemies
  end
end
