require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'ball'

font = Font.new(32)
#画面サイズ
Window.width= 853
Window.height= 480

player_img = Image.load("image/player.png")
enemy_img = Image.new(32,32).circleFill(16,16,16,[255,255,0,0])
ball_img = Image.new(32,32).circleFill(16,16,16,[255,0,255,255])

player = Player.new(100, 100, player_img)
ball = Ball.new(420, 240, ball_img)

enemies = []
for num in 0..9 do
  enemies << Enemy.new(rand(0..(853 - 32 - 1)), rand((480 - 32 - 1)), enemy_img, num)
  #敵に番号をふるよう修正した
end

Window.loop do
  player.update
  player.draw

  ball.update
  ball.draw

  Enemy.draw(enemies)
  
  Window.draw_font(10, 10, "スコア：#{player.score}", font)

  #キーを押している間ballに加速度を与える
  #playerが撃墜されたら動作しない
  if Input.key_down?(K_SPACE)&&(!player.vanished?)
    ball.accelerate(player.x,player.y)
  end

  #当たり判定とその後の処理
  if(Sprite.check(ball, enemies))
    player.score += 1 #加点
  end
  if(Sprite.check(ball, player))||(Sprite.check(enemies, player))
    ball.vx = 0
    ball.vy = 0
    #playerが撃墜された後もスコアが加算されないよう、ballを止める
  end
end