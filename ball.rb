class Ball < Sprite
    attr_accessor :vx
    attr_accessor :vy
    def initialize(x, y, image)
      @vx = 0
      @vy = 0
      #ballの速さ
      super
    end
  
    def accelerate(px,py) #ballの移動量決定
      dx = px - self.x
      dy = py - self.y
      deno = Math.sqrt(dx * dx + dy * dy) * 20
      dx = dx.to_f / deno
      dy = dy.to_f / deno
      @vx += dx
      @vy += dy
    end
  
    def update #ballの移動
      self.x += @vx
      self.y += @vy
      if (self.x <= 0) || (self.x >= (853 - 32))
        @vx = -@vx
      end
      if (self.y <= 0) || (self.y >= (480 - 32))
        @vy = -@vy
      end
    end
  end