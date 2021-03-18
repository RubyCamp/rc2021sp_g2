class System
  attr_accessor :scene
  attr_accessor :score
  attr_accessor :life
  
  def initialize
    @scene = :title
    @score = 0
    @life = 5
    @font = Font.new(32)
  end

  def update
    @score += 1
    Window.draw_font(600, 20, "SCORE: #{ @score / 60 }", @font)
  end

  def getScene
    @scene
  end
end