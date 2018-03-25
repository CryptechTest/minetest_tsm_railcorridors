-- This file stores the various node types. This makes it easier to plug this mod into games
-- in which you need to change the node names.

-- Node names (Don't use aliases!)
tsm_railcorridors.nodes = {
	dirt = "default:dirt",
	chest = "default:chest",
	rail = "carts:rail",
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

	-- Alternative to corridor_woods. If specified as a function.
	-- this will be called to return the wood type.
	-- Parameters:
	-- * pos: Position in which the rail corridors start
	-- * node: Node table of that position
	-- Returns: 2 itemstrings. First one is the wood node, second one is the fence node.
	--     Example: "example:wood", "example:fence"
	corridor_woods_function = nil,
}

-- List of cart entities. Carts will be placed randomly of the right-hand or left side of
-- the main rail.
tsm_railcorridors.carts = {}

if minetest.get_modpath("carts") then
	table.insert(tsm_railcorridors.carts, "carts:cart")
end

if minetest.get_modpath("mobs_monster") then
	tsm_railcorridors.nodes.cobweb = "mobs:cobweb"

	-- This is for games to add their spawner node. No spawner is added by default
	-- because Mobs Redo's mob spawner is still unfinished.
	-- If you set this, you MUST also set tsm_railcorridors.place_spawner.
	tsm_railcorridors.nodes.spawner = nil
end

-- This is called after a spawner has been placed by the game.
-- Use this to properly set up the metadata and stuff.
-- This is needed for games if they include mob spawners.
function tsm_railcorridors.on_construct_spawner(pos)
end

-- This is called after a cart has been placed by the game.
-- Use this to properly set up entity metadata and stuff.
-- * pos: Position of cart
-- * cart: Cart entity
function tsm_railcorridors.on_construct_cart(pos, cart)
end

local mg_name = minetest.get_mapgen_setting("mg_name")
-- Fallback function. Returns a random treasure. This function is called for chests
-- only if the Treasurer mod is not found.
-- pr: A PseudoRandom object
function tsm_railcorridors.get_default_treasure(pr)
	if pr:next(0,1000) < 30 then
		return "farming:bread "..pr:next(1,3)
	elseif pr:next(0,1000) < 50 then
		-- Seeds and saplings.
		-- This includes saplings which are normally unobtainable in v6. :-)

		local r = pr:next(0,1000)
		-- 25%
		if r < 250 then
			return "farming:seed_cotton "..pr:next(1,5)
		-- 25%
		elseif r < 500 then
			return "farming:seed_wheat "..pr:next(1,5)
		-- 20%
		elseif r < 700 then
			return "default:sapling "..pr:next(1,4)
		-- 13%
		elseif r < 830 then
			return "default:acacia_sapling "..pr:next(1,2)
		-- 13%
		elseif r < 960 then
			return "default:aspen_sapling "..pr:next(1,3)
		-- 2.5%
		elseif r < 985 then
			return "default:bush_sapling "..pr:next(1,4)
		-- 1.5%
		else
			return "default:acacia_bush_sapling "..pr:next(1,4)
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


