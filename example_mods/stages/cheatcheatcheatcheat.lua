function onCreate()
	-- background shit
	makeLuaSprite('cheat', 'cheat', -1500, -900);
	setLuaSpriteScrollFactor('cheat', 0, 0);
	scaleObject('cheat', 2, 2)
	addLuaSprite('cheat', false);

	makeLuaSprite('cheat2', 'cheat2', -1800, -900);
	setLuaSpriteScrollFactor('cheat2', 0, 0);
	scaleObject('cheat2', 2, 2)
	addLuaSprite('cheat', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end