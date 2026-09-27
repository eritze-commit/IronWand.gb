local expo_decay = 0
local enmey_max_buffer = 0
local modulator = 0.01
for i = 0 , 100 do 
    --expo_decay = 1 * (1 - (2.71828^-modulator)^ math.min(100,i) )
    expo_decay = (i/100) 
    print("cur floor "..i.."______ "..expo_decay)
    for b = 1, 3 do  
         enemy_buffer =   math.floor( 1 + expo_decay * 2 + b * (expo_decay * 3 ) + 0.5 )
--         enemy_buffer = math.floor(1 + expo_decay * 2 + b * (expo_decay * 3) + 0.5)
         print("-- ".."wave "..b.."/3".." enemies "..enemy_buffer)
    end
end
