function Global_Collider(dt)
  Collisions_TirsJoueur_Soldats(dt)
  Collisions_TirsSoldats_Joueur(dt)
  Collisions_Grenade_Soldats(dt)
end

function Collisions_TirsJoueur_Soldats(dt)
  for i=#bullet_object.player,1,-1 do
    local bop = bullet_object.player[i]
    for j=#soldat_object.liste,1,-1 do
      local sol = soldat_object.liste[j]
      if bop.x > sol.head.x and bop.x < sol.x+sol.head.w and bop.y > sol.head.y and bop.y < sol.y + sol.head.h then
        sol.headshot = true
        player_object.settings.pv = player_object.settings.pv + 0.25
        table.remove(bullet_object.player, i)
      end
    end
  end
end

function Collisions_TirsSoldats_Joueur(dt)
  for i=#bullet_object.soldat,1,-1 do
    local bos = bullet_object.soldat[i]
    
    if bos.y > player_object.settings.hitbox.y and bos.x > player_object.settings.hitbox.x and bos.x+bos.w < player_object.settings.hitbox.x+player_object.settings.hitbox.w then
    player_object.settings.pv = player_object.settings.pv - 1
      if player_object.settings.pv <= 0 then
        game:Defaite()
      end
      table.remove(bullet_object.soldat, i)
    end
  end
end

function Collisions_Grenade_Soldats(dt)
end