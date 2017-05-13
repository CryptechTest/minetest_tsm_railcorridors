-- This file stores the various node types. This makes it easier to plug this mod into subgames
-- in which you need to change the node names.

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
