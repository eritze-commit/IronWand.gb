local map_state = require("main.Player_assets.G-UNZ.Hud_state")
local global = require("main.GLOBAL.GLOBAL")

-- 30 leters is max description size  3 lines max per description 

local upgrade = {
	
	upgrade_master_list = { 

		{
		type = "bullet", 
		name = "bounce", 
		bounces = function() return  math.floor((1 + (map_state.map_cur_floor/ global.max_floor) * 10 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		bounce_chance = function() return  math.floor((map_state.map_cur_floor/ global.max_floor) * 100 + (math.random() < 0.5 and math.random(5,20) or 0) )   end,
		price = function() return 5 + math.random(1,10) +  math.floor(1 + (map_state.map_cur_floor/ global.max_floor) * 100)  end,
		description = function(self)
			return  self.type..": "..self.name.."\n bounces - "..self.bounces.."\n chance to bounce "..self.bounce_chance.."%"
		end
		
		},
		
	},


	upgrade_slots = { { },{ },{ },{ },{ },{ } },
	
	data_layer = {
		["bounce"] = {bounces = 2 ,bounce_chance  = 100 },
		["pierce"] = {pierce = 5 ,pierce_chance  = 100},

	},

	shop_slots = {{},{},{}},

	generate_shop_slots = function(self) 
		self.shop_slots = {{},{},{}}
		
		for i = 1 , 3 do 
			local random_choice  = math.random(1, #self.upgrade_master_list )
			for key, value in pairs(self.upgrade_master_list[random_choice]) do 
				
				if type(value) == "function" and key ~= "description" then 
					self.shop_slots[i][key] = value()
				elseif type(value) ~= "function" then 
					self.shop_slots[i][key] = value
				end
			end
			self.shop_slots[i]["description"] = self.upgrade_master_list[random_choice].description(self.shop_slots[i])
		end
	end,
		

	change_slot = function(self, slot , shop_slot)
		
		
	end
	
		
	

}
return upgrade