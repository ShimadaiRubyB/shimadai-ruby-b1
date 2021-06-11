class Player < Sprite
  attr_accessor :score # 追加
  def initialize(x, y, image) # 追加
    @score = 0
    super
  end

  def update
    self.x += Input.x
    self.y += Input.y
    #入力に使うキーを変更（時間に余裕があれば）
  end

  def shot # 追加
    @score += 1
  end
  #加点の方法を修正
end