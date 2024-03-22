local grenade = {}

function grenade:Load()
end

function grenade:Create()
  grenade = {}
  grenade.img = love.graphics.newImage("img_jam/grenade.png")
  grenade.x = bras_g.x+45
  grenade.y = bras_g.y+15
  grenade.launch = false
end

function grenade:Update(dt)
  --Maj de la position de la grenade.
  grenade.x = bras_g.x+45
  --grenade.y = bras_g.y+15
  if grenade.launch then
    grenade.y = grenade.y - 50*dt
  end
end

function grenade:Draw()
  love.graphics.draw(grenade_img, grenade.x, grenade.y)
end

return grenade