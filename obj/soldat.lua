-- Penser à appeler le soldat:Draw entre l'affichage du fond et l'affichage des cahutes.

--Creations des ennemis.
local function Cree_Soldat(sol_table)
  local sldt = {}
  sldt.img = soldat_img
  sldt.sang = sang_img
  sldt.x = 25
  sldt.y = 230
  sldt.vx = 50
  sldt.w = sldt.img:getWidth()
  sldt.h = sldt.img:getHeight()
  sldt.r = 0
  sldt.headshot = false
  sldt.head = {x=sldt.x-15, y=sldt.y+5, w=sldt.x+10, h=30}
  sldt.depop = 1
  sldt.timer_pause = 2
  sldt.timer_tir = 0.1
  sldt.rafale = 0
  table.insert(sol_table, sldt)
end

local soldat = {}

soldat.liste = {}

function soldat:Load()
  spawn = 1
end

function soldat:Update(dt)
  --Spawn.
  spawn = spawn - dt
  if spawn <= 0 then
    Cree_Soldat(self.liste)
    spawn = 1
  end
  
  for i=#self.liste,1,-1 do
    local soldat = self.liste[i]
    -- Déplacement des soldats et update de la position de leur hitbox.
    -- Ecoulement de la pause entre deux rafales.
    soldat.x = soldat.x + soldat.vx*dt
    soldat.head.x = soldat.head.x + soldat.vx*dt
    soldat.timer_pause = soldat.timer_pause - dt
    
    if soldat.headshot == false then
      if soldat.timer_pause <= 0 then
        soldat.timer_pause = 0
        soldat.timer_tir = soldat.timer_tir - dt -- Ecoulement du temps entre deux tirs.
        if soldat.timer_tir <= 0 then
          bullet_object:Create(bullet_object.soldat, bullet_img, soldat.x, soldat.y+70) -- Création d'une balle.
          soldat.rafale = soldat.rafale + 1 -- Gestion des rafales et reset quand un soldat à tirer 10 balles.
          soldat.timer_tir = 0.1
          if soldat.rafale == 10 then
            soldat.timer_tir = 0
            soldat.rafale = 0
            soldat.timer_pause = 2
          end
        end
      end
    end
    
    if soldat.headshot then
      soldat.vx = 0
      soldat.r = math.rad(90)
      soldat.head.x = soldat.x + soldat.w+65
      soldat.head.y = soldat.y + soldat.h-15
      soldat.depop = soldat.depop - dt
      if soldat.depop <= 0 then
        soldat.depop = 0
        table.remove(self.liste, i)
      end
    end
    
    if soldat.x >= largeur then
      table.remove(self.liste, i)
    end
  end
  
end

function soldat:Draw()
  for i=#self.liste,1,-1 do
    local soldat = self.liste[i]
    love.graphics.draw(soldat.img, soldat.x, soldat.y+soldat.img:getHeight(), soldat.r, 1, 1, soldat.img:getWidth()/2, soldat.img:getHeight())
    if soldat.headshot then
      love.graphics.draw(soldat.sang, soldat.x+soldat.w+75, soldat.y+soldat.h)
    end
  end
end

function soldat:Keypressed(key)
end

function soldat:Mousepressed(x, y, button)
end

return soldat


