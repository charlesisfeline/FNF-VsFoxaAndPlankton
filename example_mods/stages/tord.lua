function onCreate()
		makeLuaSprite('bgtord', 'bgtord', 900, -190);
		scaleObject('bgtord', 1.75, 1.75)
	addLuaSprite('bgtord', false);	
			setProperty('bgtord.visible', true);

		makeLuaSprite('stage2', 'HousesAndFloor', 900, -190);
		scaleObject('stage2', 1.75, 1.75)
	addLuaSprite('stage2', false);	
			setProperty('stage2.visible', true);

	setProperty('stage2.visible', false)
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == 'changebg1' then
			setProperty('bgtord.visible', false);
			setProperty('stage2.visible', true);
		end
		if value1 == 'norm' then
			setProperty('stage2.visible', false);
			setProperty('bgtord.visible', true);
		end
	end
end