local map_state = require("main.Player_assets.G-UNZ.Hud_state")
local global = require("main.GLOBAL.GLOBAL")

-- 30 leters is max description size  3 lines max per description 
local max_upgrade_cost = 20 
local upgrade = {
	
	upgrade_master_list = { 

		{
		type = "bullet", 
		name = "bounce", 
		bounces = function() return  math.floor((1 +  global.floor_t * 10 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		bounce_chance = function() return math.floor( global.floor_t * 70 ) + (math.random(1,10)+ math.floor(math.random() * (map_state.map_cur_floor/ global.max_floor) * 20) )   end,
		price = function() return  math.random(1,3) +  math.floor(global.floor_t * max_upgrade_cost)  end,
		description = function(self)
			return  self.type..": "..self.name.."\n bounces - "..self.bounces.."\n chance to bounce "..self.bounce_chance.."%"
		end
		
	},
	{
		type = "bullet", 
		name = "pierce", 
		pierces = function() return math.floor((1 + global.floor_t * 10 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		pierce_chance = function() return math.floor( global.floor_t * 70 ) + (math.random(1,10)+ math.floor(math.random() * global.floor_t * 20) ) end,
		price = function() return math.random(1,3) +  math.floor(global.floor_t * max_upgrade_cost) end,
		description = function(self)
			return  self.type..": "..self.name.."\n pierces - "..self.pierces.."\n chance to pierce "..self.pierce_chance.."%"
		end

	},
--	["ak47"] = {spread = 15, bul_speed = 210, delay = 0.15, ammount = 1, recoil = 2,dmg = 1.5, reload_speed = 1 ,max_mag_size = 35, in_mag = 35, total_mags = 10},
	{
		type = "ak47", 
		name = "2gun",
		gun_name = function() return "ak47" end,
		has_gun = function() return 1 end,
		spread = function() return 15 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.25  - global.floor_t * 0.1 ) - math.random() * global.floor_t * 0.05 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (1  + global.floor_t * 2) + math.random() + global.floor_t * 1 end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 35 end, 
		in_mag = function() return 35 end,
		total_mags = function() return 10  end,
		price = function() return math.random(1,3) +  math.floor(global.floor_t * max_upgrade_cost)  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
		{
		type = "g19", 
		name = "1gun",
		gun_name = function() return "g19" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.30  - global.floor_t * 0.1 ) - math.random() * global.floor_t * 0.05 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (1.5  + global.floor_t * 2) + math.random() + global.floor_t * 1 end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 15 end, 
		in_mag = function() return 15 end,
		total_mags = function() return "INF"  end,
		price = function() return math.random(1,3) +  math.floor(global.floor_t * max_upgrade_cost) end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
		

		
	},


	upgrade_slots = { { },{ },{ },{ },{ },{ } },
	
	data_layer = {
		["bounce"] = {bounces = 0 ,bounce_chance  = 0 },
		["pierce"] = {pierces = 0 ,pierce_chance  = 0},
		["2gun"] = {gun_name = 0 , has_gun = 0,spread = 0 , bul_speed = 0, delay = 0 , ammount = 0 , recoil = 0 , dmg = 0 ,max_mag_size = 0, in_mag = 0, total_mags = 0, reload_speed = 0  },
		["1gun"] = {gun_name = 0 , has_gun = 0,spread = 0 , bul_speed = 0, delay = 0 , ammount = 0 , recoil = 0 , dmg = 0 ,max_mag_size = 0, in_mag = 0, total_mags = 0, reload_speed = 0  },

	},

	shop_slots = {{},{},{}},

	modify_data_layer = function(self) 
		for key, value  in pairs(self.data_layer) do 
			for key1 , value1 in pairs(self.data_layer[key]) do 
				self.data_layer[key][key1] = 0
				
			end
		end
		for index , item  in ipairs(self.upgrade_slots) do 
			if self.upgrade_slots[index] ~= nil then 
				for key, value in pairs(self.upgrade_slots[index]) do 
					for key1 ,value1 in pairs(self.data_layer[self.upgrade_slots[index].name]) do 
						if key == key1 then 
							self.data_layer[self.upgrade_slots[index].name][key1] = value
						end 
					end
				end
			end
		end
	end,
	--FIRST INDEX IS THE UPGRADE PlAYER SLOT YOURE ADDING TOO SECOND IS THE SHOP SLOT YOURE GETTING DATA FROM 

	add_to_upgrade_slot =  function(self, index , select_index ) 
		self.upgrade_slots[index] = {}
		for key, value in pairs(self.shop_slots[select_index]) do 
			self.upgrade_slots[index][key] = value
			
		end
			
	end,

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
