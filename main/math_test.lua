local expo_decay = 0
local enmey_max_buffer = 0
local modulator = 0.01
for i = 0 , 100 do 
    expo_decay = 1 * (1 - (2.71828^-modulator)^ math.min(100,i) )
    print("cur floor "..i.."______ "..expo_decay)
    for b = 1, 3 do  
         enemy_buffer = 2 +  math.floor( expo_decay * 8 )  +   math.floor( ( b * (expo_decay * 8 ) ) )
         print("-- ".."wave "..b.."/3".." enemies "..enemy_buffer)
    end
end
