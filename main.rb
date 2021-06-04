require 'dxruby'

require_relative 'player'
require_relative 'enemy'

font = Font.new(32) # 追加
#画面サイズ
Window.width= 853
Window.height= 480

player_img = Image.load("image/player.png")
enemy_img = Image.load("image/enemy.png")

player = Player.new(100, 100, player_img)
enemies = []
10.times do
  enemies << Enemy.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), enemy_img)
end

Window.loop do
  player.update
  player.draw

  Sprite.draw(enemies)
  Window.draw_font(10, 10, "スコア：#{player.score}", font) # 追加

  Sprite.check(player, enemies)
end