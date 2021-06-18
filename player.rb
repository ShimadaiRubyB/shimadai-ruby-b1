class Player < Sprite
  attr_accessor :score
  def initialize(x, y, image)
    @score = 0
    super
  end

  def update #WASDで移動するよう変更、画面外に行かないよう調整
    if Input.key_down?(K_D) && self.x <= (853 - 32)
      self.x += 2
    end
    if Input.key_down?(K_A) && self.x >= 0
      self.x -= 2
    end
    if Input.key_down?(K_S) && self.y <= (480 - 32)
      self.y += 2
    end
    if Input.key_down?(K_W) && self.y >= 0
      self.y -= 2
    end
  end

  def hit
    self.vanish
  end
end