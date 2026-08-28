-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local player_state = {
	player_dir = vmath.vector3(),
	player_speed = 0 ,
	dashing = false,
	health = 5,
	max_health = 5,
	alive = false,
}
return player_state
