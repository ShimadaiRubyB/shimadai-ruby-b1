require 'dxruby'

require_relative 'player'
require_relative 'enemy'

font = Font.new(32) # 追加
#画面サイズ
Window.width= 853
Window.height= 480

player_img = Image.load("image/player.png")
enemy_img = Image.load("image/enemy.png")
#完成したら必要が無くなるのでコメントアウトする

player = Player.new(100, 100, player_img)
#player_imgが必要なくなったら消す
enemies = []
10.times do
  enemies << Enemy.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), enemy_img)
  #敵に番号をふるなら要修正
end

Window.loop do
  player.update
  player.draw

  Sprite.draw(enemies)
  Window.draw_font(10, 10, "スコア：#{player.score}", font) # 追加

  Sprite.check(player, enemies)
  #敵同士の当たり判定を追加する必要あり
end