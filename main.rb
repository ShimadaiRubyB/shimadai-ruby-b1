require 'dxruby'

require_relative 'player'
require_relative 'enemy'

font = Font.new(32) # 追加
#画面サイズ
Window.width= 853
Window.height= 480

player_img = Image.load("image/player.png")
enemy_img = Image.new(32,32).circleFill(16,16,16,[255,255,0,0])

player = Player.new(100, 100, player_img)

enemies = []
for num in 0..9 do
  enemies << Enemy.new(rand(0..(853 - 32 - 1)), rand((480 - 32 - 1)), enemy_img, num)
  #敵に番号をふるなら要修正
end

Window.loop do
  player.update
  player.draw

  enemies[0].move(player.x,player.y)
  enemies[0].update

  Enemy.draw(enemies)
  Window.draw_font(10, 10, "スコア：#{player.score}", font) # 追加

  Sprite.check(enemies, enemies)
  #敵同士の当たり判定を追加する必要あり
end