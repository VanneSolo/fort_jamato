local bullet = {}

bullet.player = {}
bullet.soldat = {}

function bullet:Load()
end

function bullet:Create(bullet_table, bullet_img, origin_x, origin_y)
  local blt = {}
  blt.img = bullet_img
  blt.x = origin_x
  blt.y = origin_y
  blt.w = 5
  blt.h = 20
  table.insert(bullet_table, blt)
end

function bullet:Update(dt, table_soldats, player)
  -- Maj de la position des balles du joueur, suppression des tir s'ils sortent de l'écran.
  -- bp = bullet player
  
  for i=#self.player,1,-1 do
    local bp = self.player[i]
    bp.y = bp.y - 350*dt
    
    if bp.y+bp.h <= 0 then
      table.remove(self.player, i)
    end
  end
  
  --Maj de la position des tirs des soldats, suppressions des tirs des soldats qui sortent de l'écran.
  for i=#self.soldat,1,-1 do
    local tir = self.soldat[i]
    tir.y = tir.y + 200*dt
    
    if tir.y >= hauteur then
      table.remove(self.soldat, i)
    end
  end
end

function bullet:Draw()
  --Affichage des tirs du joueur.
  for i=#self.player,1,-1 do
    local bullet = self.player[i]
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end
  
  --Affichage des tirs des soldats.
  for i=#self.soldat,1,-1 do
    local tir_soldat = self.soldat[i]
    love.graphics.draw(tir_soldat.img, tir_soldat.x, tir_soldat.y, tir_soldat.r)
  end
  
end

return bullet