require_relative 'player'

class Enemy < Sprite
  attr_accessor :player_x
  attr_accessor :player_y
  attr_accessor :pex
  attr_accessor :pey
  attr_accessor :rotatin
  attr_accessor :vx
  attr_accessor :vy
  attr_accessor :ax
  attr_accessor :ay
  @rotatin = 0 
  
  def hit=(px,py)
    @player_x=px
    @player_y=py 
    @rotation = 1
     @pex =self.x - @player_x
     @pey =self.y - @player_y
     @vx = (10/@pey)
     @vy = (10/@pex)
      
  end

  def update=(px,py)
    if @rotation == 1
      @player_x=px
      @player_y=py
      @ax=(1/@pex)
      @ay=(1/@pey)
      @vx-=@ax
      @vy-=@ay
      self.x +=@vx
      self.y +=@vy
      @pex =self.x - player.x
      @pey =self.y - player.y
    end
  end

  def shot
    self.vanish
  end

   
end