class Enemy < Sprite
  #initializeで番号を指定
  #番号にアクセサをつける
  def hit
    self.vanish
  end
  #hitとshotを適宜変更
  #enemyの移動メソッドを追加
end
