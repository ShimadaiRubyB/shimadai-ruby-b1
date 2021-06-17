class Enemy < Sprite
  #initializeで番号を指定
  #番号にアクセサをつける
  attr_accessor :number # 追加
  attr_accessor :ax #x座標方向の加速度
  attr_accessor :ay #y座標方向の加速度
  attr_accessor :vx #x座標方向の速度
  attr_accessor :vy #y座標方向の速度
  attr_accessor :t　#時間カウンター
  def initialize(x, y, image, number) # 追加
    @number = number
    @font = Font.new(20)

    @ax = 0
    @ay = 0
    @vx = 0
    @vy = 0
    @t = 0
    super
  end

  def update
    self.x+=@vx
    self.y+=@vy
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

  def move(px,py)
    if Input.key_down?(K_LMENU)#Altキーを押してる間tカウンターを増やし続ける
      @t+=1
      if (@t == 30)#30フレームの間Altキーを押し続けたら加速度と速度を更新
        @ax= ((px - self.x)/(Math.sqrt((px - self.x)*(px - self.x)+(py - self.y)*(py - self.y))))
        @ay= ((py - self.y)/(Math.sqrt((px - self.x)*(px - self.x)+(py - self.y)*(py - self.y))))
        @vx= (@vx + @ax).round
        @vy= (@vy + @ay).round
        @t = 0  
      end      
    end
  end

end
