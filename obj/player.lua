local player = {}

function player:Load()
  --Creation du joueur.
  local vie = 500
  self.settings = {}
  self.settings.fusil = fusil_img
  self.settings.w = self.settings.fusil:getWidth()
  self.settings.h = self.settings.fusil:getHeight()
  self.settings.x = largeur/2 - self.settings.w/2
  self.settings.y = hauteur - self.settings.h
  self.settings.hitbox = {x=self.settings.x+20, y=self.settings.y+100, w=self.settings.w-40, h=165}
  self.settings.pv = vie
  
  bras_g = {}
  bras_g.img = bras_gauche_img
  bras_g.x = self.settings.x-80
  bras_g.y = 400
  bras_g.tourne = false
  bras_g.r = 0
end

function player:Update(dt)
  --Récupération de la position du curseur et maj de la position du joueur et de sa hitbox.
  mouse_x = love.mouse.getX()
  self.settings.x = mouse_x - self.settings.w/2
  bras_g.x = self.settings.x-80
  if self.settings.x + self.settings.w >= largeur then
    self.settings.x = largeur - self.settings.w
    bras_g.x = self.settings.x-80
  elseif self.settings.x <= 80 then
    self.settings.x = 80
    bras_g.x = self.settings.x-80
  end
  self.settings.hitbox = {x=self.settings.x+20, y=self.settings.y+100, w=self.settings.w-40, h=165}
  
  --Rotation du bras gauche et lancé de la grenade.
  if bras_g.tourne then
    bras_g.r = bras_g.r + 0.1
    if bras_g.r >= math.rad(90) then
      bras_g.r = 0
      bras_g.tourne = false
    end
  end
  
end

function player:Draw()
  --Affichage du joueur.
  love.graphics.draw(self.settings.fusil, self.settings.x, self.settings.y)
  love.graphics.draw(bras_g.img, bras_g.x+80, bras_g.y+200, bras_g.r, 1, 1, 80, 200)
end

function player:Keypressed(key)
end

function player:Mousepressed(x, y, button)
  local mouse_x = love.mouse.getX()
--Création des tirs du joueur.
  if button == 1 then
    bullet_object:Create(bullet_object.player, bullet_img, self.settings.x + self.settings.w/2 + 10, self.settings.y + 70)
  elseif button == 2 then
    bras_g.tourne = true
    --grenade.launch = true
  end
end

return player