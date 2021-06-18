class Enemy < Sprite
  #initializeで番号を指定
  def initialize(x, y, image, number)
    @number = number
    @font = Font.new(20)
    super
  end

  def draw #敵の描画。円の上に番号を表示する。
    super
    Window.draw_font(self.x + 10, self.y + 6, @number.to_s, @font)
  end

  def hit #ballが当たったら消える
    self.vanish
  end
end
