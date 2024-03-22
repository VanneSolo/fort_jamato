-- Il faudra déplacer l'affichage des cahutes dans un autre module qui s'affichera par dessus les soldats.

local background = {}

function background:Load()
  fond_lvl_1 = {}
  fond_lvl_1.img = love.graphics.newImage("img_jam/fond_lvl_1.png")
  fond_lvl_1.x = 0
  fond_lvl_1.y = 0
  
  cahute_d = love.graphics.newImage("img_jam/cahute_d.png")
  cahute_g = love.graphics.newImage("img_jam/cahute_g.png")
end

function background:Update(dt)
end

function background:Draw()
  --Affichage du fond.
  love.graphics.draw(fond_lvl_1.img, fond_lvl_1.x, fond_lvl_1.y)
  
  --Affichage des cahutes gauche et droite.
  love.graphics.draw(cahute_d, 700, 210)
  love.graphics.draw(cahute_g, 0, 220)
end

return background