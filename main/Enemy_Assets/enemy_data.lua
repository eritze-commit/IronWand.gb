local enemy_data = {
  -- enemy_master_list = {"bat","skull","cow","slime","batorb","wall","bee","saw","eye","bomb","mole","spider","btrf","glitch","steye","assasin"},
enemy_master_list = { {category = "tank",name = "mole" } ,{category = "tank",name = "cow" },{category = "tank",name = "saw" },{category = "tank",name = "btrf" } ,
{category = "shooter",name = "skull" } ,{category = "shooter",name = "bee" },{category = "shooter",name = "spider" },{category = "shooter",name = "steye" },
{category = "rusher",name = "bat" }, {category = "rusher",name = "batorb" }, {category = "rusher",name = "eye" }, {category = "rusher",name = "assasin" },
{category = "disruptor",name = "wall" },{category = "disruptor",name = "slime" },{category = "disruptor",name = "bomb" },{category = "disruptor",name = "glitch" },
 },
   
    --enemy_master_list = {"glitch"},
    floor_incriment = 6,
    cur_floor_incriment = 0 ,
    next_floor_incriment = 0,
    last_round_category = "",
    last_floor_category = "",
    last_pick_category = "",
    cur_round_enemy_list = {},
    cur_floor_enemy_list = {},
    reset_enemie_buffers = function(self) 
		self.last_round_category = ""
		self.last_pick_category = ""
		self.last_floor_category = ""
		self.cur_round_enemy_list = {}
		self.cur_floor_enemy_list = {}
		self.cur_floor_incriment = 0 
		self.next_floor_incriment = self.floor_incriment
    end,
	add_new_round_enemy = function(self) 
		local new_enemy = "6767"
		new_enemy = self.enemy_master_list[math.random(1,#self.enemy_master_list)]
		while new_enemy.category == self.last_round_category do
			new_enemy = self.enemy_master_list[math.random(1,#self.enemy_master_list)]
		end
		self.cur_round_enemy_list[#self.cur_round_enemy_list+1] = new_enemy
		self.last_round_category = new_enemy.category
	end,
	add_new_floor_enemy = function(self) 
		local new_enemy = "6767"
		new_enemy = self.cur_round_enemy_list[ math.random(1, #self.cur_round_enemy_list) ]
		while new_enemy.category == self.last_floor_category do
			new_enemy = self.cur_round_enemy_list[math.random(1,#self.cur_round_enemy_list)]
		end
		self.cur_floor_enemy_list[#self.cur_floor_enemy_list+1] = new_enemy
		self.last_floor_category = new_enemy.category
	end,
	pick_new_enemy = function(self)
		local new_enemy = "6767"
		new_enemy = self.cur_floor_enemy_list[math.random(1,#self.cur_floor_enemy_list)]
		while new_enemy.category == self.last_pick_category do
			new_enemy = self.cur_floor_enemy_list[math.random(1,#self.cur_floor_enemy_list)]
		end
		self.last_pick_category = new_enemy.category
		return new_enemy.name
	end,
	new_floor = function(self)
		self.cur_floor_incriment = self.cur_floor_incriment + 1 
		if self.cur_floor_incriment == self.next_floor_incriment then
			self.next_floor_incriment = self.next_floor_incriment + self.floor_incriment
			self.add_new_round_enemy(self)
		end
		
		self.cur_floor_enemy_list = {}
		for i = 1, 7 do 
			self.add_new_floor_enemy(self)
		end
		self.cur_floor_enemy_list[#self.cur_floor_enemy_list+1] = {category = "wildcard",name = "wildcard"}
		--pprint(self.cur_floor_enemy_list)
		
	end,
	start_run = function(self)
		self.reset_enemie_buffers(self)
		for i = 1, 6 do 
			self.add_new_round_enemy(self)
		end
		--pprint(self.cur_round_enemy_list)
		for i = 1, 7 do 
		--	print("last_floor_cat",self.last_floor_category)
			self.add_new_floor_enemy(self)
		end
		self.cur_floor_enemy_list[#self.cur_floor_enemy_list+1] = {category = "wildcard",name = "wildcard"}
		--pprint(self.cur_floor_enemy_list)
	end,
	
	
    
    enemies = {
        ["bat"] = {
		name = "bat",
		speed = 35, 
		health = math.random(30,50),
		attack_cooldown = 2,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0,
			rush = 1,
			flee = 0, 
			circle = 0
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 3,
            rush_speed_multiplier = 2.5,
            rush_time = 0.1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 2.5,
            fluke_noise_strenght = 0,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0,
            fluke_noise = false,
            flee_noise = false,
            rush_noise = true,
            circle_noise = false,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "smart_shot", bullet = "medium", speed = 60 , diameter = 7 },
            
        },
        special_attacks = {
			{type = "smart_shot", bullet = "phase", speed = 100 , diameter = 7 },

        },
	},
	 ["assasin"] = {
		name = "assasin",
		speed = 35, 
		health = math.random(40,50),
		attack_cooldown = 5,
		smart_aim =  true,
		h_flip = true ,
		weight_values = { 
			fluke = 0,
			rush = 1,
			flee = 0, 
			circle = 0
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 3,
            rush_speed_multiplier = 2.5,
            rush_time = 0.2,
            fluke_time = 0.2,
            fluke_speed_multiplier = 2.5,
            fluke_noise_strenght = 0,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0,
            fluke_noise = false,
            flee_noise = false,
            rush_noise = true,
            circle_noise = false,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "smart_semiauto_shot", bullet = "phase", speed = 50, diameter = 6 ,ammount = 2 ,modulation = 2 },
            
        },
        special_attacks = {
			{type = "smart_semiauto_shot", bullet = "phase", speed = 80, diameter = 6 ,ammount = 5 ,modulation = 2.3  },

        },
	},
    ["glitch"] = {
		name = "glitch",
		speed = 5, 
		health = math.random(20,30),
		attack_cooldown = 0.2 ,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0.3,
			rush = 0.7,
			flee = 0, 
			circle = 0
		},
		hitbox_diameter = 13,
		x_ray = true,
		movement_values = {
            path_find_frequency = 1,
            rush_speed_multiplier = 10,
            rush_time =  1 ,
            fluke_time = 1,
            fluke_speed_multiplier = 10,
            fluke_noise_strenght = 0,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0,
            fluke_noise = false,
            flee_noise = false,
            rush_noise = true,
            circle_noise = false,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "speed_change", bullet = "medium", speed = 60    , diameter = 0, modulation = {multiply = 10, time =  1 } },
            {type = "slugfollow_shot", bullet = "big", speed = 50 , diameter = 13, ammount = 1 , modulation = {cone = 0.5, offset = 10,lifetime = 6 ,speed = 0.025} }, 
            {type = "semiauto_shot",  bullet = "star", speed = 0, diameter = 6,ammount = 2 ,modulation = 0.02 },
			{type = "speed_change", bullet = "medium", speed = 60    , diameter = 0, modulation = {multiply = 15, time =  0.5 } },
            
        },
        special_attacks = {
			{type = "speed_change", bullet = "medium", speed = 60    , diameter = 0, modulation = {multiply = 15, time =  1 } },
            {type = "slugfollow_shot", bullet = "big", speed = 50 , diameter = 13, ammount = 2 , modulation = {cone = 0.5, offset = 15,lifetime = 3 ,speed = 0.025} }, 
            {type = "semiauto_shot",  bullet = "star", speed = 0, diameter = 6,ammount = 3 ,modulation = 0.02 },
            {type = "speed_change", bullet = "medium", speed = 60    , diameter = 0, modulation = {multiply = 15, time =  0.5 } },

        },
	},
	["mole"] = {
		name = "mole",
		speed = 0, 
		health = math.random(50,60),
		attack_cooldown = 5,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0.25,
			rush = 0,
			flee = 0.25, 
			circle = 0.5
		},
		x_ray = true,
		hitbox_diameter = 13,
		movement_values = {
            path_find_frequency = 1,
            rush_speed_multiplier = 1.5,
            rush_time = 0.5,
            fluke_time = 0.5,
            fluke_speed_multiplier = 1.5,
            fluke_noise_strenght = 0,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0,
            fluke_noise = false,
            flee_noise = false,
            rush_noise = true,
            circle_noise = false,
            can_dash = false,
		},
		knockback = false,
        attacks = {
            {type = "arc_shot", bullet = "arc", speed = 50, diameter = 13,ammount = 3 ,modulation = {height=50,time= 0.4 } },
            
        },
        
        special_attacks = {
			 {type = "arc_shot", bullet = "arc", speed = 50, diameter = 13,ammount = 5 ,modulation = {height=50,time= 0.5} },

        },
	},
	["batorb"] = {
		name = "batorb",
		speed = 30, 
		health = math.random(30,50),
		attack_cooldown = 3,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0.2,
			rush = 0.8,
			flee = 0, 
			circle = 0
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.3,
            rush_time = 0.3,
            fluke_time = 0.1,
            fluke_speed_multiplier = 2,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "slug_shot", bullet = "big", speed = 70 , diameter = 7, ammount = 3 , modulation = 6 },
            
        },
        
        special_attacks = {
			{type = "slug_shot", bullet = "big", speed = 50 , diameter = 6, ammount = 7, modulation = 2 },

        },
	},
	["btrf"] = {
		name = "btrf",
		speed = 30, 
		health = math.random(60,70),
		attack_cooldown = 3,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0.2,
			rush = 0.4,
			flee = 0, 
			circle = 0.4
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.3,
            rush_time = 0.3,
            fluke_time = 0.1,
            fluke_speed_multiplier = 2,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "chain_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 5 , modulation = 7 },
            {type = "chain_shot", bullet = "medium", speed = 60 , diameter = 6, ammount = 3 , modulation = 7 },
            
        },
        
        special_attacks = {
			{type = "chain_shot", bullet = "tiny", speed = 100 , diameter = 3, ammount = 5 , modulation = 7 },
            {type = "chain_shot", bullet = "medium", speed = 90 , diameter = 6, ammount = 5 , modulation = 7 },
			{type = "chain_shot", bullet = "big", speed = 60 , diameter = 7, ammount = 5 , modulation = 7 },

        },
	},
	["spider"] = {
		name = "spider",
		speed = 30, 
		health = math.random(40,60),
		attack_cooldown = 5,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0.2,
			rush = 0.4,
			flee = 0, 
			circle = 0.4
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1,
            rush_time = 0.3,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = false,
		},
		knockback = true,
        attacks = {
            {type = "semiauto_shot", bullet = "tiny", speed = 40, diameter = 6,ammount = 8,modulation = 2 },
            
        },
        
        special_attacks = {
			{type = "semiauto_shot", bullet = "tiny", speed = 50, diameter = 6,ammount = 16,modulation = 2 },

        },
	},
	 ["eye"] = {
		name = "eye",
		speed = 30, 
		health = math.random(30,50),
		attack_cooldown = 4,
		smart_aim =  true,
		h_flip = false ,
		weight_values = { 
			fluke = 0.2,
			rush = 0.8,
			flee = 0, 
			circle = 0
		},
		hitbox_diameter = 10,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.6,
            rush_time = 0.5,
            fluke_time = 0.1,
            fluke_speed_multiplier = 2,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "cross_shot", bullet = "medium", speed = 50 , diameter = 6, ammount = 4 , modulation = 4 },
        },
        special_attacks = {
			{type = "cross_shot", bullet = "medium", speed = 50 , diameter = 6, ammount = 4 , modulation = 8 },

        },
	},
	 ["bomb"] = {
		name = "bomb",
		speed = 30, 
		health = 0.001,
		attack_cooldown = 100,
		smart_aim =  true,
		h_flip = true ,
		weight_values = { 
			fluke = 0.25,
			rush = 0.25,
			flee = 0.25, 
			circle = 0.25
		},
		hitbox_diameter = 10,
		x_ray = true,
		movement_values = {
            path_find_frequency = 2,
            rush_speed_multiplier = 1,
            rush_time = 0.5,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1,
            fluke_noise_strenght = 0,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0,
            fluke_noise = false,
            flee_noise = false,
            rush_noise = true,
            circle_noise = false,
            can_dash = false,
		},
		knockback = true,
        attacks = {
            {type = "explode", bullet = "tiny", speed = 200 , diameter = 6, ammount = 15, modulation = 0.5 },
            
        },
        special_attacks = {
			{type = "explode", bullet = "tiny", speed = 200 , diameter = 6, ammount = 25, modulation = 0.5 },

        },
	},
	["bee"] = {
		name = "bee",
		speed = 30, 
		health = math.random(30,50),
		attack_cooldown = 4,
		smart_aim =  true,
		h_flip = true ,
		weight_values = { 
			fluke = 0.2,
			rush = 0.4,
			flee = 0, 
			circle = 0.4
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.3,
            rush_time = 0.3,
            fluke_time = 0.1,
            fluke_speed_multiplier = 2,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "homing_shot", bullet = "dart", speed = 50 , diameter = 3, ammount = 3 , modulation = {cone = 0.7, offset = 5} }, 
            
        },
        special_attacks = {
			{type = "homing_shot", bullet = "dart", speed = 50 , diameter = 3, ammount = 9, modulation = {cone = 0.5, offset = 10}},

        },
	},
	["skull"] = {
		name = "skull",
		speed = 40, 
		health = math.random(30,50),
		attack_cooldown = 5 ,
		smart_aim =  false,
		h_flip = true ,
		weight_values = { 
			fluke = 0.4,
			rush = 0.1,
			flee = 0.1, 
			circle = 0.4
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.5,
            rush_time = 0.1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1.5,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = false,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "semiauto_shot", bullet = "medium", speed = 79, diameter = 7,ammount = 3,modulation = 2 },

        },
        special_attacks = {
			{type = "semiauto_shot", bullet = "medium", speed = 79, diameter = 7,ammount = 8 ,modulation = 2 },

        },
	},
	["cow"] = {
		name = "cow",
		speed = 35, 
		health = math.random(50,70),
		attack_cooldown = 5 ,
		smart_aim =  false,
		h_flip = true ,
		weight_values = { 
			fluke = 0.5,
			rush = 0.5,
			flee = 0.0, 
			circle = 0.0
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.5,
            rush_time = 1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 2,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = false,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "follow_shot", bullet = "big", speed = 79, diameter = 13,ammount = 1 ,modulation = 5 },

        },
        special_attacks = {
			{type = "slugfollow_shot", bullet = "big", speed = 50 , diameter = 13, ammount = 3 , modulation = {cone = 0.5, offset = 10 ,lifetime = 4 ,speed = 0.025} }, 
--			{type = "follow_shot", bullet = "big", speed = 79, diameter = 13,ammount = 1 ,modulation = 5 },

        },
	},
	["slime"] = {
		name = "slime",
		speed = 30, 
		health = math.random(50,60),
		attack_cooldown = 7 ,
		smart_aim =  false,
		h_flip = true ,
		weight_values = { 
			fluke = 0,
			rush = 0.5,
			flee = 0.0, 
			circle = 0.5
		},
		hitbox_diameter = 13,
		x_ray = true,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.1,
            rush_time = 1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1.5,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = false,
            rush_noise = true,
            circle_noise = true,
            can_dash = false,
		},
		knockback = true,
        attacks = {
            {type = "semiauto_shot", bullet = "star", speed = 0, diameter = 6,ammount = 5 ,modulation = 0.01 },

			},
        special_attacks = {
            {type = "semiauto_shot",  bullet = "star", speed = 0, diameter = 6,ammount = 10 ,modulation = 0.02 },

        },
	},
	["wall"] = {
		name = "wall",
		speed = 25, 
		health = math.random(50,70),
		attack_cooldown = 5 ,
		smart_aim =  false,
		h_flip = true ,
		weight_values = { 
			fluke = 0,
			rush = 0.5,
			flee = 0.0, 
			circle = 0.5
		},
		hitbox_diameter = 15,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.1,
            rush_time = 1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1.5,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = false,
            rush_noise = true,
            circle_noise = true,
            can_dash = false,
		},
		knockback = false,
        attacks = {
			{type = "slugfollow_shot", bullet = "tiny", speed = 50 , diameter = 6, ammount = 4 , modulation = {cone = 0.5, offset = 11,lifetime = 5,speed = 0.05} }, 
			{type = "slugfollow_shot", bullet = "tiny", speed = 50 , diameter = 6, ammount = 3 , modulation = {cone = 0.5, offset = 11,lifetime = 5,speed = 0.05} }, 
			{type = "slugfollow_shot", bullet = "tiny", speed = 50 , diameter = 6, ammount = 2 , modulation = {cone = 0.5, offset = 11,lifetime = 5,speed = 0.05} }, 

        },
         special_attacks = {
			{type = "slugfollow_shot", bullet = "tiny", speed = 50 , diameter = 6, ammount = 10 , modulation = {cone = 0.5, offset = 15, lifetime = 4 ,speed = 0.07} }, 

        }
	},
	["saw"] = {
		name = "saw",
		speed = 25, 
		health = math.random(50,70),
		attack_cooldown = 5 ,
		smart_aim =  false,
		h_flip = true ,
		weight_values = { 
			fluke = 0,
			rush = 0.5,
			flee = 0.0, 
			circle = 0.5
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.1,
            rush_time = 1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1.5,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = false,
		},
		knockback = false,
        attacks = {
			{type = "delayslug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 15 , modulation = {time = 4 , cone  = 0.5} },
			{type = "slug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 9 , modulation = 0.5 },

        },
         special_attacks = {
            {type = "delayslug_shot", bullet = "tiny", speed = 60 , diameter = 3, ammount = 27 , modulation = {time = 4 , cone  = 0.5 } },
            {type = "slug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 17 , modulation = 0.5 },

        }
	},
	["steye"] = {
		name = "steye",
		speed = 0, 
		health = math.random(20,40),
		attack_cooldown = 4 ,
		smart_aim =  true,
		h_flip = false,
		weight_values = { 
			fluke = 0,
			rush = 0.5,
			flee = 0.0, 
			circle = 0.5
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 5,
            rush_speed_multiplier = 1.1,
            rush_time = 1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1.5,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = false,
            rush_noise = true,
            circle_noise = true,
            can_dash = false,
		},
		knockback = false,
        attacks = {
            {type = "smart_shot", bullet = "tiny", speed = 180, diameter = 3,ammount = 1 ,modulation = 1},
        },
        special_attacks = {
            {type = "smart_semiauto_shot", bullet = "tiny", speed = 150, diameter = 3 ,ammount = 3 ,modulation = 3 },

        },
	},
	 ["wildcard"] = {
		name = "wildcard",
		speed = 30, 
		health = math.random(40,50),
		attack_cooldown = 5,
		smart_aim =  true,
		h_flip = true ,
		weight_values = { 
			fluke = 0.25,
			rush = 0.25,
			flee = 0.25, 
			circle = 0.25
		},
		hitbox_diameter = 13,
		x_ray = false,
		movement_values = {
            path_find_frequency = 3,
            rush_speed_multiplier = 1.5,
            rush_time = 0.1,
            fluke_time = 0.1,
            fluke_speed_multiplier = 1,
            fluke_noise_strenght = 0.5,
            flee_noise_strenght = 0.5,
            rush_noise_strenght = 0.5,
            circle_noise_strenght = 0.5,
            fluke_noise = true,
            flee_noise = true,
            rush_noise = true,
            circle_noise = true,
            can_dash = true,
		},
		knockback = true,
        attacks = {
            {type = "smart_semiauto_shot", bullet = "phase", speed = 50, diameter = 6 ,ammount = 2 ,modulation = 2 },
            {type = "smart_shot", bullet = "tiny", speed = 100, diameter = 3,ammount = 1 ,modulation = 1},
            {type = "delayslug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 11 , modulation = {time = 4 , cone  = 0.5} },
			{type = "slug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 7 , modulation = 0.5 },
			{type = "slugfollow_shot", bullet = "tiny", speed = 50 , diameter = 6, ammount = 3 , modulation = {cone = 0.5, offset = 11,lifetime = 5,speed = 0.05} }, 
			{type = "follow_shot", bullet = "big", speed = 79, diameter = 13,ammount = 1 ,modulation = 5 },
			{type = "semiauto_shot", bullet = "medium", speed = 79, diameter = 7,ammount = 3,modulation = 2 },
			{type = "homing_shot", bullet = "dart", speed = 50 , diameter = 3, ammount = 2 , modulation = {cone = 0.7, offset = 5} }, 
			{type = "cross_shot", bullet = "medium", speed = 50 , diameter = 6, ammount = 4 , modulation = 4 },
			{type = "semiauto_shot", bullet = "tiny", speed = 40, diameter = 6,ammount = 8,modulation = 2 },
			{type = "chain_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 5 , modulation = 7 },
			{type = "slug_shot", bullet = "big", speed = 70 , diameter = 6, ammount = 3 , modulation = 6 },
			{type = "arc_shot", bullet = "arc", speed = 40, diameter = 12,ammount = 2 ,modulation = {height=40,time= 0.4 } },
			{type = "smart_shot", bullet = "medium", speed = 60 , diameter = 7 },
            
        },
        special_attacks = {
			{type = "smart_semiauto_shot", bullet = "phase", speed = 80, diameter = 6 ,ammount = 4 ,modulation = 2.3  },
			{type = "smart_semiauto_shot", bullet = "tiny", speed = 100, diameter = 3 ,ammount = 4 ,modulation = 3 },
			{type = "delayslug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 15 , modulation = {time = 4 , cone  = 0.5} },
			{type = "slug_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 9 , modulation = 0.5 },
			{type = "slugfollow_shot", bullet = "tiny", speed = 50 , diameter = 6, ammount = 6 , modulation = {cone = 0.5, offset = 20,lifetime = 5,speed = 0.05} }, 
			{type = "slugfollow_shot", bullet = "big", speed = 50 , diameter = 13, ammount = 3 , modulation = {cone = 0.5, offset = 10 ,lifetime = 4 ,speed = 0.025} },         
			{type = "semiauto_shot", bullet = "medium", speed = 79, diameter = 7,ammount = 5 ,modulation = 2 },
			{type = "homing_shot", bullet = "dart", speed = 50 , diameter = 3, ammount = 3 , modulation = {cone = 0.5, offset = 5} }, 
			{type = "cross_shot", bullet = "medium", speed = 50 , diameter = 6, ammount = 4 , modulation = 8 },
		    {type = "semiauto_shot", bullet = "tiny", speed = 40, diameter = 6,ammount = 16 ,modulation = 2 },
		    {type = "chain_shot", bullet = "tiny", speed = 70 , diameter = 3, ammount = 10 , modulation = 7 },
		    {type = "slug_shot", bullet = "big", speed = 70 , diameter = 6, ammount = 5 , modulation = 6 },
		    {type = "arc_shot", bullet = "arc", speed = 40, diameter = 12,ammount = 3 ,modulation = {height=40,time= 0.4 } },
		    {type = "smart_shot", bullet = "medium", speed = 70 , diameter = 7 },

        },
	},
    
    },



}
return enemy_data
