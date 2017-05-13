-- This file stores the various node types. This makes it easier to plug this mod into subgames
-- in which you need to change the node names.

-- Node names (Don't use aliases!)
tsm_railcorridors.nodes = {
	dirt = "default:dirt",
	chest = "default:chest",
	rail = "default:rail",
	torch_floor = "default:torch",
	torch_wall = "default:torch_wall",

	--[[ Wood types for the corridors. Corridors are made out of full wood blocks
	and posts. For each corridor system, a random wood type is chosen with the chance
	specified in per mille. ]]
	corridor_woods = {
		{ wood = "default:wood", post = "default:fence_wood", chance = 800},
		{ wood = "default:junglewood", post = "default:fence_junglewood", chance = 150},
		{ wood = "default:acacia_wood", post = "default:fence_acacia_wood", chance = 45},
		{ wood = "default:pine_wood", post = "default:fence_pine_wood", chance = 3},
		{ wood = "default:aspen_wood", post = "default:fence_aspen_wood", chance = 2},
	},
}

-- Fallback function. Returns a random treasure. This function is called for chests
-- only if the Treasurer mod is not found.
-- pr: A PseudoRandom object
function tsm_railcorridors.get_default_treasure(pr)
	if pr:next(0,1000) < 30 then
		return "farming:bread "..pr:next(1,3)
	elseif pr:next(0,1000) < 50 then
		if pr:next(0,1000) < 500 then
			return "farming:seed_cotton "..pr:next(1,5)
		else
			return "farming:seed_wheat "..pr:next(1,5)
		end
	elseif pr:next(0,1000) < 5 then
		return "tnt:tnt "..pr:next(1,3)
	elseif pr:next(0,1000) < 5 then
		return "default:pick_steel"
	elseif pr:next(0,1000) < 3 then
		local r = pr:next(0, 1000)
		if r < 400 then
			return "default:steel_ingot "..pr:next(1,5)
		elseif r < 700 then
			return "default:gold_ingot "..pr:next(1,3)
		elseif r < 900 then
			return "default:mese_crystal "..pr:next(1,3)
		else
			return "default:diamond "..pr:next(1,2)
		end
	elseif pr:next(0,1000) < 30 then
		return "default:torch "..pr:next(1,16)
	elseif pr:next(0,1000) < 20 then
		return "default:coal_lump "..pr:next(3,8)
	else
		return ""
	end
end
