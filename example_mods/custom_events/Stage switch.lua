function onCreate() -- put the stuff here
	makeLuaSprite('house', 'HousesAndFloor', 900, -190);
	setLuaSpriteScrollFactor('house', 1.71, 1.71);		
end

function onEvent(name, value1, value2)
	if name == 'Crack Mind' then -- put the add lua and stuff here
	addLuaSprite('house', false);
	end
end