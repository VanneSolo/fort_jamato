LA = love.audio
LT = love.timer
LK = love.keyboard
LM = love.math
LG = love.graphics
LW = love.window
LF = love.filesystem

require("lib.math_ex")
require("lib.vector")
game = require("mod.game")

require("mod.transform")
require("mod.collider")
require("mod.outils")

game.assets_manager:Add_Object("grenade", require("obj.grenade"))
game.assets_manager:Add_Object("play_background", require("obj.play_background"))
game.assets_manager:Add_Object("soldat", require("obj.soldat"))
game.assets_manager:Add_Object("player", require("obj.player"))
game.assets_manager:Add_Object("bullet", require("obj.bullet"))

intro = require("scenes.intro")
menu = require("scenes.menu")
play = require("scenes.play")
victoire = require("scenes.victoire")
defaite = require("scenes.defaite")

--[[game.assets_manager:Load_Font("font_24", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_30", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_40", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_70", "font/Inconsolata-Regular.ttf")]]

game.assets_manager:Load_Image("img_bombe", "img_jam/bombe.png")
game.assets_manager:Load_Image("img_bonhomme_win", "img_jam/bonhomme_win.png")
game.assets_manager:Load_Image("img_bras_gauche", "img_jam/bras_gauche.png")
game.assets_manager:Load_Image("img_bullet", "img_jam/bullet.png")
game.assets_manager:Load_Image("img_cahute_d", "img_jam/cahute_d.png")
game.assets_manager:Load_Image("img_cahute_g", "img_jam/cahute_g.png")
game.assets_manager:Load_Image("img_citerne", "img_jam/citerne.png")
game.assets_manager:Load_Image("img_defaite_sang", "img_jam/defaite_sang.png")
game.assets_manager:Load_Image("img_defaite_text", "img_jam/defaite_text.png")
game.assets_manager:Load_Image("img_explosion_1", "img_jam/explosion_1.png")
game.assets_manager:Load_Image("img_explosion_2", "img_jam/explosion_2.png")
game.assets_manager:Load_Image("img_explosion_3", "img_jam/explosion_3.png")
game.assets_manager:Load_Image("img_explosion_4", "img_jam/explosion_4.png")
game.assets_manager:Load_Image("img_fond_lose", "img_jam/fond_lose.png")
game.assets_manager:Load_Image("img_fond_lvl_1", "img_jam/fond_lvl_1.png")
game.assets_manager:Load_Image("img_fond_menu", "img_jam/fond_menu.png")
game.assets_manager:Load_Image("img_fond_win", "img_jam/fond_win.png")
game.assets_manager:Load_Image("img_fusil", "img_jam/fusil.png")
game.assets_manager:Load_Image("img_grenade", "img_jam/grenade.png")
game.assets_manager:Load_Image("img_sang", "img_jam/sang.png")
game.assets_manager:Load_Image("img_soldat_1", "img_jam/soldat1.png")
game.assets_manager:Load_Image("img_soldat_2", "img_jam/soldat2.png")
game.assets_manager:Load_Image("img_text_info", "img_jam/text_info.png")
game.assets_manager:Load_Image("img_usine", "img_jam/usine.png")
game.assets_manager:Load_Image("img_win_text", "img_jam/win_text.png")

game.assets_manager:Load_Video("video_intro", "videos/vdo_intro.ogv")

--[[game.assets_manager:Load_Sound("snd_explode_large", "sons/bangLarge.wav")
game.assets_manager:Load_Sound("snd_explode_medium", "sons/bangMedium.wav")
game.assets_manager:Load_Sound("snd_explode_small", "sons/bangSmall.wav")
game.assets_manager:Load_Sound("snd_new_live", "sons/newlive.ogg")
game.assets_manager:Load_Sound("snd_ovni_big", "sons/saucerBig.wav")
game.assets_manager:Load_Sound("snd_ovni_small", "sons/saucerSmall.wav")
game.assets_manager:Load_Sound("snd_reacteur", "sons/thrust.wav")
game.assets_manager:Load_Sound("snd_select", "sons/select.mp3")
game.assets_manager:Load_Sound("snd_tir", "sons/fire.wav")

game.assets_manager:Load_Music("msc_music", "sons/music.mp3")

game.assets_manager:Load_Video("video_highscore", "videos/gameover.ogv")
game.assets_manager:Load_Video("video_menu", "videos/menu.ogv")]]

--
bullet_object = game.assets_manager:Get_Object("bullet")
bullet_img = game.assets_manager:Get_Image("img_bullet")
--
grenade_object = game.assets_manager:Get_Object("grenade")
grenade_img = game.assets_manager:Get_Image("img_grenade")
--
play_background_object = game.assets_manager:Get_Object("play_background")
play_background_img = game.assets_manager:Get_Image("img_play_background")
--
player_object = game.assets_manager:Get_Object("player")
player_img = game.assets_manager:Get_Image("img_player")
fusil_img = game.assets_manager:Get_Image("img_fusil")
bras_gauche_img = game.assets_manager:Get_Image("img_bras_gauche")
--
soldat_object = game.assets_manager:Get_Object("soldat")
soldat_img = game.assets_manager:Get_Image("img_soldat_1")
--
fond_menu_img = game.assets_manager:Get_Image("img_fond_menu")
grenade_img = game.assets_manager:Get_Image("img_grenade")
bullet_img = game.assets_manager:Get_Image("img_bullet")
sang_img = game.assets_manager:Get_Image("img_sang")
--
bonhomme_win_img = game.assets_manager:Get_Image("img_bonhomme_win")
bombe_img = game.assets_manager:Get_Image("img_bombe")
win_text_img = game.assets_manager:Get_Image("img_win_text")
text_info_img = game.assets_manager:Get_Image("img_text_info")
fond_win_img = game.assets_manager:Get_Image("img_fond_win")
citerne_img = game.assets_manager:Get_Image("img_citerne")
usine_img = game.assets_manager:Get_Image("img_usine")

fond_lose_img = game.assets_manager:Get_Image("img_fond_lose")
defaite_text_img = game.assets_manager:Get_Image("img_defaite_text")

--selection_sound = game.assets_manager:Get_Sound("snd_select")
--
--tir_sound = game.assets_manager:Get_Sound("snd_tir")

--[[font_24 = game.assets_manager:Get_Font("font_24")
font_30 = game.assets_manager:Get_Font("font_30")
font_40 = game.assets_manager:Get_Font("font_40")
font_70 = game.assets_manager:Get_Font("font_70")]]

--game_music = game.assets_manager:Get_Music("msc_music")

vdo_intro = game.assets_manager:Get_Video("video_intro")

--[[
vdo_menu = game.assets_manager:Get_Video("video_menu")
vdo_highscore = game.assets_manager:Get_Video("video_highscore")]]