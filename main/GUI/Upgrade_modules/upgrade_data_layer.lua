local map_state = require("main.Player_assets.G-UNZ.Hud_state")
local global = require("main.GLOBAL.GLOBAL")

-- 30 leters is max description size  3 lines max per description  
local function price_calc() 
	local max_upgrade_cost = 20
	return ( math.random(1,2) +  math.floor(global.floor_t * max_upgrade_cost) ) + (math.floor(math.random()*global.floor_t*5))
end
local upgrade = {
	
	upgrade_master_list = { 
		-- BULLET UPGRADES 
	{
		type = "bullet", 
		name = "bounce", 
		bounces = function() return  math.floor((1 +  global.floor_t * 10 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		bounce_chance = function() return math.floor( global.floor_t * 70 ) + (math.random(5,10)+ math.floor(math.random() * global.floor_t * 20) )   end,
		price = function() return  price_calc()  end,
		description = function(self)
			return  self.type..": "..self.name.."\n bounces - "..self.bounces.."\n chance to bounce "..self.bounce_chance.."%"
		end
		
	},
	{
	-- smae upgrade for better balance 
		type = "bullet", 
		name = "bounce", 
		bounces = function() return  math.floor((1 +  global.floor_t * 10 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		bounce_chance = function() return math.floor( global.floor_t * 65 ) + (15 + math.floor(math.random() * global.floor_t * 20) )   end,
		price = function() return  price_calc()  end,
		description = function(self)
			return  self.type..": "..self.name.."\n bounces - "..self.bounces.."\n chance to bounce "..self.bounce_chance.."%"
		end
		
	},
	{
		type = "bullet", 
		name = "shrapnel", 
		shrapnel = function() return  math.floor((1 +  global.floor_t * 2 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		shrapnel_chance = function() return math.floor( global.floor_t * 70 ) + (math.random(5,10)+ math.floor(math.random() * global.floor_t * 20) )   end,
		price = function() return  price_calc()  end,
		description = function(self)
			return  self.type..": "..self.name.."\n ammount - "..self.shrapnel.."\n chance "..self.shrapnel_chance.."%"
		end
		
	},
	{
	-- smae upgrade for better odds 
		type = "bullet", 
		name = "shrapnel", 
		shrapnel = function() return  math.floor((1 +  global.floor_t * 2 ) + (math.random() < 0.2 and math.random(0,2) or 0) ) end,
		shrapnel_chance = function() return math.floor( global.floor_t * 65 ) + (15 + math.floor(math.random() * global.floor_t * 20) )   end,
		price = function() return  price_calc()  end,
		description = function(self)
			return  self.type..": "..self.name.."\n ammount - "..self.shrapnel.."\n chance "..self.shrapnel_chance.."%"
		end
		
	},

	{
		type = "bullet", 
		name = "pierce", 
		pierces = function() return math.floor(1 + global.floor_t * 5 ) + ( math.floor(math.random() * global.floor_t * 5) )  end,
		pierce_chance = function() return math.floor( global.floor_t * 70 ) + (math.random(5,10)+ math.floor(math.random() * global.floor_t * 20) ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n pierces - "..self.pierces.."\n chance to pierce "..self.pierce_chance.."%"
		end

	},
	{
	-- same upgrade for better odds 
		type = "bullet", 
		name = "pierce", 
		pierces = function() return math.floor(1 + global.floor_t * 5 ) + ( math.floor(math.random() * global.floor_t * 5) )  end,
		pierce_chance = function() return math.floor( global.floor_t * 15 ) + (15 + math.floor(math.random() * global.floor_t * 20) ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n pierces - "..self.pierces.."\n chance to pierce "..self.pierce_chance.."%"
		end

	},
	{
		type = "bullet", 
		name = "exploding", 
		diameter = function() return math.floor(20 + global.floor_t * 39 ) + ( math.floor(math.random() * global.floor_t * 20) )  end,
		chance = function() return math.floor( global.floor_t * 20 ) + (math.random(5,10)+ math.floor(math.random() * global.floor_t * 20) ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n diameter - "..self.diameter.."\n chance to explode "..self.chance.."%"
		end

	},
	{
	-- same upgrade for better odds 
		type = "bullet", 
		name = "exploding", 
		diameter = function() return math.floor(20 + global.floor_t * 39 ) + ( math.floor(math.random() * global.floor_t * 20) )  end,
		chance = function() return math.floor( global.floor_t * 15 ) + (15+ math.floor(math.random() * global.floor_t * 20) ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n diameter - "..self.diameter.."\n chance to explode "..self.chance.."%"
		end

	},
	{
	-- same upgrade for better odds 
		type = "bullet", 
		name = "-dmg loss", 
		loss =  function() return (0.1  +  global.floor_t * 0.45  ) + ( math.random() * global.floor_t * 0.45 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n - "..string.format("%.1f",self.loss * 100 ).."%\n damage loss"
		end

	},
	-- DROPS UPGRADES 
	{
		type = "loot", 
		name = "+mags", 
		mags = function() return (1  + math.floor( global.floor_t * 1 ) ) + ( math.floor(math.random() * global.floor_t * 1) ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..self.mags.." per mag looted" 
		end

	},
	{
		type = "loot", 
		name = "+heart", 
		health = function() return (0.2  +  global.floor_t * 0.5  ) + ( math.random() * global.floor_t * 0.5 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.health).." per heart looted" 
		end

	},
	-- stat upgrades
	 {
		type = "stat", 
		name = "+crit", 
		damage = function() return (0.1  +  global.floor_t * 0.5) + ( math.random() * global.floor_t * 0.4) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.damage * 100 ) .." % crit damage" 
		end

	},
	{
		type = "stat", 
		name = "^crit", 
		chance = function() return (0.1  +  global.floor_t * 0.5) + ( math.random() * global.floor_t * 0.9) end,--  (0.1  +  global.floor_t * 0.5) + ( math.random() * global.floor_t * 0.4) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.chance * 10 ) .." % crit chance" 
		end

	},
	-- enemy UPGRADES 
	{
		type = "enemy", 
		name = "shrapnel death", 
		shrapnel = function() return math.floor(3 + global.floor_t * 1 ) + ( math.floor(math.random() * global.floor_t * 3) )  end,
		chance = function() return math.floor( global.floor_t * 30) + (10 + math.floor(math.random() * global.floor_t * 30) ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n shrapnel on enemy death - "..self.shrapnel.."\n chance "..self.chance.."%"
		end

	},
	
	-- Player UPGRADES
	{
	type = "player",
	name = "shield",
	owns =  function() return  1 end,
--	active = function() return  1 end,
	max_recharge = function() return  (3  -  math.floor( global.floor_t * 2.2 ))  end,
--	buffer  = function() return  (3  -  math.floor( global.floor_t * 2.2 ))  end,
	price = function() return price_calc() end,
	description = function(self)
			return  self.type..": "..self.name.."\n absorbs 1 hit\n recharges every "..self.max_recharge.." floor"
		end
	},
	{
	type = "player",
	name = "spiky dash",
	dmg = function() return (2  +  global.floor_t * 2) + ( math.random() * global.floor_t * 2) end,
	price = function() return price_calc() end,
	description = function(self)
			return  self.type..": "..self.name.."\n "..string.format("%.1f",self.dmg) .." dmg " 
		end
	
	}, 
	{
		type = "player", 
		name = "quicker dash", 
		speed = function() return (0.1  +  global.floor_t * 1  ) + ( math.random() * global.floor_t * 0.40 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.speed * 100 ) .." % shorter\n dash cooldown" 
		end

	},
	{
		type = "player", 
		name = "+player speed", 
		speed = function() return (0.1  +  global.floor_t * 0.1  ) + ( math.random() * global.floor_t * 0.1 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.speed * 100 ) .." %\n player walking speed" 
		end

	},
	{
		type = "player", 
		name = "dodge", 
		chance = function() return (0.1  +  global.floor_t * 0.20  ) + ( math.random() * global.floor_t * 0.20 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.chance * 100 ) .." % bullet\n dodge chance " 
		end

	},
	-- actuall GUN UPGRADES 
	{
		type = "gun", 
		name = "+reload speed", 
		speed = function() return (0.1  +  global.floor_t * 0.20  ) + ( math.random() * global.floor_t * 0.20 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.speed * 100 * 2) .." % faster reload  " 
		end

	},
	{
		type = "gun", 
		name = "+mag size", 
		size = function() return (0.1  +  global.floor_t * 0.45  ) + ( math.random() * global.floor_t * 0.45 ) end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n + "..string.format("%.1f",self.size * 100 ) .." % more bullets\n per mag" 
		end

	},
	-- mixed upgrades 
	{
		type = "bonus", 
		name = "free reroll", 
		reroll = function() return 1 end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.type..": "..self.name.."\n gives you 1 free\n reroll every new shop" 
		end
	},


	-- GUN 2 UPGRADES 
	{
		type = "ak47", 
		name = "2gun",
		gun_name = function() return "ak47" end,
		has_gun = function() return 1 end,
		spread = function() return 15 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.25  - global.floor_t * 0.05 ) - math.random() * global.floor_t * 0.05 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (1.25  + global.floor_t * 0.5) + (math.random() * global.floor_t * 0.5 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 35 end, 
		in_mag = function() return 35 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "x-12", 
		name = "2gun",
		gun_name = function() return "x-12" end,
		has_gun = function() return 1 end,
		spread = function() return 130 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (1 - global.floor_t * 0.15 ) - math.random() * global.floor_t * 0.15 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 10 end ,
		recoil = function() return 5 end , 
		dmg = function()   return (0.7 + global.floor_t * 0.50) + (math.random() * global.floor_t * 0.30 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 4 end, 
		in_mag = function() return 4 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "ump45", 
		name = "2gun",
		gun_name = function() return "ump45" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.25  - global.floor_t * 0.05 ) - math.random() * global.floor_t * 0.05 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (1.25  + global.floor_t * 0.5) + (math.random() * global.floor_t * 0.5 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 1.5 end ,
		max_mag_size = function() return 30 end, 
		in_mag = function() return 30 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "p90", 
		name = "2gun",
		gun_name = function() return "p90" end,
		has_gun = function() return 1 end,
		spread = function() return 1 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.2  - global.floor_t * 0.05 ) - math.random() * global.floor_t * 0.05 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (1 + global.floor_t * 0.25) + (math.random() * global.floor_t * 0.25 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 30 end, 
		in_mag = function() return 30 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "m16", 
		name = "2gun",
		gun_name = function() return "m16" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.4  - global.floor_t * 0.05 ) - math.random() * global.floor_t * 0.05 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (2  + global.floor_t * 1.25) + (math.random() * global.floor_t * 1.25 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 30 end, 
		in_mag = function() return 30 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "revolver", 
		name = "2gun",
		gun_name = function() return "revolver" end,
		has_gun = function() return 1 end,
		spread = function() return 5 end, 
		bul_speed = function() return 230 end,
		delay = function() return  (0.1  - global.floor_t * 0.025 ) - math.random() * global.floor_t * 0.025 end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 3 end , 
		dmg = function()   return (2  + global.floor_t * 1) + (math.random() * global.floor_t * 1) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 3 end ,
		max_mag_size = function() return 6 end, 
		in_mag = function() return 6 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	--["shotgun"] = {spread = 20, bul_speed = 200, delay = 2, ammount = 10, recoil = 7,dmg = 1,reload_speed = 2  ,   max_mag_size = 5, in_mag = 5, total_mags = self.defualt_cheat_vl },
	{
		type = "shotgun", 
		name = "2gun",
		gun_name = function() return "shotgun" end,
		has_gun = function() return 1 end,
		spread = function() return 25 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (1 - global.floor_t * 0.25 ) - (math.random() * global.floor_t * 0.25) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 10 end ,
		recoil = function() return 7 end , 
		dmg = function()   return (0.5  + global.floor_t * 0.1) + (math.random() * global.floor_t * 0.15 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 3 end ,
		max_mag_size = function() return 4 end, 
		in_mag = function() return 4 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "spas-12", 
		name = "2gun",
		gun_name = function() return "spas-12" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 260 end,
		delay = function() return  (1 - global.floor_t * 0.25 ) - (math.random() * global.floor_t * 0.25) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 10 end ,
		recoil = function() return 7 end , 
		dmg = function()   return (0.4  + global.floor_t * 0.15) + (math.random() * global.floor_t * 0.15 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 3 end ,
		max_mag_size = function() return 3 end, 
		in_mag = function() return 3 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
--		["awp"] = {spread = 1, bul_speed = 260, delay = 1, ammount = 1, recoil = 10,dmg = 20, reload_speed = 1 , max_mag_size = 1, in_mag = 1, total_mags = self.defualt_cheat_vl },
	{
		type = "awp", 
		name = "2gun",
		gun_name = function() return "awp" end,
		has_gun = function() return 1 end,
		spread = function() return 1 end, 
		bul_speed = function() return 260 end,
		delay = function() return  1   end,
		ammount = function() return 1 end ,
		recoil = function() return 10 end , 
		dmg = function()   return (10 + global.floor_t * 10) + (math.random() * global.floor_t * 10) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 4 end ,
		max_mag_size = function() return 1 end, 
		in_mag = function() return 1 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "uzi", 
		name = "2gun",
		gun_name = function() return "uzi" end,
		has_gun = function() return 1 end,
		spread = function() return 30 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.15  - global.floor_t * 0.03 ) - ( math.random() * global.floor_t * 0.03 )  end,
		ammount = function() return 1 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (0.5  + global.floor_t * 0.05) + (math.random() * global.floor_t * 0.05 ) end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 50 end, 
		in_mag = function() return 50 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "minigun", 
		name = "2gun",
		gun_name = function() return "minigun" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 250 end,
		delay = function() return  (0.1  - global.floor_t * 0.005 ) - ( math.random() * global.floor_t * 0.005 )  end,
		ammount = function() return 1 end ,
		recoil = function() return 1 end , 
		dmg = function() return 0.35   end,--  math.random() + global.floor_t * 1 end,
		reload_speed = function() return 5 end ,
		max_mag_size = function() return 100 end, 
		in_mag = function() return 100 end,
		total_mags = function() return 5  end,
		price = function() return price_calc()  end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	
	-- GUN 1 UPGRADES 
		{
		type = "g19", 
		name = "1gun",
		gun_name = function() return "g19" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.5  - global.floor_t * 0.1 ) - (math.random() * global.floor_t * 0.05) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (2  + global.floor_t * 1.5) + (math.random() * global.floor_t * 0.5) end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 15 end, 
		in_mag = function() return 15 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "vector", 
		name = "1gun",
		gun_name = function() return "vector" end,
		has_gun = function() return 1 end,
		spread = function() return 1 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.2  - global.floor_t * 0.05 ) - (math.random() * global.floor_t * 0.05) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (0.8  + global.floor_t * 0.15) + (math.random() * global.floor_t * 0.15) end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 20 end, 
		in_mag = function() return 20 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "two-barrel", 
		name = "1gun",
		gun_name = function() return "two-barrel" end,
		has_gun = function() return 1 end,
		spread = function() return 15 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.7  - global.floor_t * 0.1 ) - (math.random() * global.floor_t * 0.1) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 2 end ,
		recoil = function() return 2 end , 
		dmg = function()   return (1.5 + global.floor_t * 0.5) + (math.random() * global.floor_t * 0.3) end,
		reload_speed = function() return 3 end ,
		max_mag_size = function() return 10 end, 
		in_mag = function() return 10 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "m100", 
		name = "1gun",
		gun_name = function() return "m100" end,
		has_gun = function() return 1 end,
		spread = function() return 5 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.2  - global.floor_t * 0.05 ) - (math.random() * global.floor_t * 0.05) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 2 end , 
		dmg = function() return ( 0.8  + global.floor_t * 0.15) + (math.random() * global.floor_t * 0.15) end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 40 end, 
		in_mag = function() return 40 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "mini uzi", 
		name = "1gun",
		gun_name = function() return "mini uzi" end,
		has_gun = function() return 1 end,
		spread = function() return 35 end, 
		bul_speed = function() return 200 end,
		delay = function() return  (0.15 - global.floor_t * 0.05 ) - (math.random() * global.floor_t * 0.04) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (0.6  + global.floor_t * 0.05) + (math.random() * global.floor_t * 0.05) end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 30 end, 
		in_mag = function() return 30 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "deagle", 
		name = "1gun",
		gun_name = function() return "deagle" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 200 end,
		delay = function() return  (0.4 - global.floor_t * 0.1 ) - (math.random() * global.floor_t * 0.1) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (1.75 + global.floor_t * 0.75) + (math.random() * global.floor_t * 0.50) end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 30 end, 
		in_mag = function() return 30 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "luger", 
		name = "1gun",
		gun_name = function() return "luger" end,
		has_gun = function() return 1 end,
		spread = function() return 10 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.3 - global.floor_t * 0.05 ) - (math.random() * global.floor_t * 0.05) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (1.20 + global.floor_t * 0.50) + (math.random() * global.floor_t * 0.25) end,
		reload_speed = function() return 1 end ,
		max_mag_size = function() return 25 end, 
		in_mag = function() return 25 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "m14", 
		name = "1gun",
		gun_name = function() return "m14" end,
		has_gun = function() return 1 end,
		spread = function() return 2 end, 
		bul_speed = function() return 260 end,
		delay = function() return  (0.7 - global.floor_t * 0.1 ) - (math.random() * global.floor_t * 0.1) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (3 + global.floor_t * 1.25) + (math.random() * global.floor_t * 1.25) end,
		reload_speed = function() return 3 end ,
		max_mag_size = function() return 10 end, 
		in_mag = function() return 10 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "volley", 
		name = "1gun",
		gun_name = function() return "volley" end,
		has_gun = function() return 1 end,
		spread = function() return 90 end, 
		bul_speed = function() return 200 end,
		delay = function() return  (1 - global.floor_t * 0.15) - (math.random() * global.floor_t * 0.15) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 5 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (1 + global.floor_t * 0.5) + (math.random() * global.floor_t * 0.5) end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 4 end, 
		in_mag = function() return 4 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	{
		type = "pocket shotgun", 
		name = "1gun",
		gun_name = function() return "pocket shotgun" end,
		has_gun = function() return 1 end,
		spread = function() return 25 end, 
		bul_speed = function() return 200 end,
		delay = function() return  (1 - global.floor_t * 0.15) - (math.random() * global.floor_t * 0.15) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 4 end ,
		recoil = function() return 3.5 end , 
		dmg = function()   return (1 + global.floor_t * 0.5) + (math.random() * global.floor_t * 0.5) end,
		reload_speed = function() return 2 end ,
		max_mag_size = function() return 4 end, 
		in_mag = function() return 4 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
--	["revolver"] = {spread = 3, bul_speed = 250, delay = 0.1, ammount = 1, recoil = 4,dmg = 4, reload_speed = 3 ,  max_mag_size = 6, in_mag = 6, total_mags = self.defualt_cheat_vl }, 
			{
		type = "snubby", 
		name = "1gun",
		gun_name = function() return "snubby" end,
		has_gun = function() return 1 end,
		spread = function() return 5 end, 
		bul_speed = function() return 210 end,
		delay = function() return  (0.1 - global.floor_t * 0.02 ) - (math.random() * global.floor_t * 0.02) end,--0.25  - (map_state.map_cur_floor/ global.max_floor) * 0.15 end,
		ammount = function() return 1 end ,
		recoil = function() return 4 end , 
		dmg = function()   return (1.5  + global.floor_t * 1) + (math.random() * global.floor_t * 1) end,
		reload_speed = function() return 3 end ,
		max_mag_size = function() return 6 end, 
		in_mag = function() return 6 end,
		total_mags = function() return "INF"  end,
		price = function() return price_calc() end,
		description = function(self)
			return  self.name..": "..self.type.."\n dmg - "..string.format("%.1f",self.dmg).."\n fire rate - ".. string.format("%.1f", 1/self.delay).." RPS"
		end
	},
	
		

		
	},


	upgrade_slots = { { },{ },{ },{ },{ },{ } },
	
	data_layer = {
		["bounce"] = {bounces = 0 ,bounce_chance  = 0 },
		["pierce"] = {pierces = 0 ,pierce_chance  = 0},
		["shrapnel"] = {shrapnel = 0 ,shrapnel_chance  = 0},
		["+mags"] = {mags = 0},
		["+heart"] = {health = 0},
		["+reload speed"] = {speed = 0},
		["quicker dash"] = {speed = 0},
		["+crit"] = {damage=0},
		["^crit"] = {chance=0},
		["dodge"] = {chance = 0},
		["+mag size"] = {size = 0},
		["exploding"] = {chance = 0 , diameter = 0 },
		["-dmg loss"] = {loss = 0 }, 
		["+player speed"] = {speed = 0 },
		["free reroll"] = {reroll = 0},
		["spiky dash"] = {dmg = 0 },
		["shield"] = {owns = 0, active = 0 , buffer = 0 , max_recharge = 0 },
		["shrapnel death"] = {chance = 0 , shrapnel = 0  },
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
