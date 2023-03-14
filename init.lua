minetest.register_on_joinplayer(function(player)
		local meta = player:get_meta()
		local health = meta:get_int("health")
		if health == 0 and meta:get_int("dead") ~= 1 then
			meta:set_int("health", 0)
			player:set_properties({
				hp_max = health
			})
			player:set_hp(meta:get_int("health"))
		elseif meta:get_int("dead") == 1 then
			local name = player:get_player_name()
			minetest.kick_player(name, "You died on a lifegiving server.")
			end
		player:set_properties({
				hp_max = health
		})
end)

minetest.register_on_dieplayer(function(player)
		local meta = player:get_meta()
		local health = meta:get_int("health")
		local health = health + 2
		meta:set_int("health", health)
		if meta:get_int("health") == 22 and player:get_hp() == 0 then
			meta:set_int("dead", 1)
			local name = player:get_player_name()
			minetest.kick_player(name, "You died on a lifegiving server.")
		end
end)

minetest.register_on_respawnplayer(function(player)
		local meta = player:get_meta()
		local health = meta:get_int("health")
		if meta:get_int("health") == 0 and player:get_hp() == 0 then
			meta:set_int("dead", 1)
			local name = player:get_player_name()
			minetest.kick_player(name, "You died on a lifegiving server.")
		else
			player:set_properties({
					hp_max = health
			})
			player:set_hp(meta:get_int("health") + 2)
		end
end)