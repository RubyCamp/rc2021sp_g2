class Enemy < Sprite
  def initialize(x, y)
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
  end
end

class Enemies
  MAX_ENEMY = 5

  def initialize
    @enemies = []
    @enemyPlace = [330, 430]
  end

  def update
    Sprite.update(@enemies)
    Sprite.clean(@enemies)

    (MAX_ENEMY - @enemies.size).times do
      if rand(1..100) > 99
        @enemies << Enemy.new(800, @enemyPlace[rand(0..1)])
      end
    end
  end

  def draw
    Sprite.draw(@enemies)
  end

  def arrayEnemies
    @enemies
  end
end