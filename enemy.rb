class Enemy < Sprite
  #initializeで番号を指定
  #番号にアクセサをつける
  attr_accessor :number # 追加
  def initialize(x, y, image, number) # 追加
    @number = number
    @font = Font.new(20)
    super
  end

  def draw
    super
    Window.draw_font(self.x + 10, self.y + 6, @number.to_s, @font)
  end

  def hit
    self.vanish
  end
  #hitとshotを適宜変更
  #enemyの移動メソッドを追加
end
