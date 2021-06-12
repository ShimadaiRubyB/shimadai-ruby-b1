class Enemy < Sprite
  #initializeで番号を指定
  #番号にアクセサをつける
  attr_accessor :number
  def initialize(x, y, image, number)
    @number = number
    @font = Font.new(20)
    super
  end

  def draw #敵の描画
    super
    Window.draw_font(self.x + 10, self.y + 6, @number.to_s, @font)
  end

  def accelerate #敵の移動量決定
  end

  def update #敵の移動
  end

  def hit
    self.vanish
  end
  #hitとshotを適宜変更
end
