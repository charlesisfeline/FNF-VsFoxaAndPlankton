function onCreate()
	-- background shit
	makeLuaSprite('pibby', 'pibby', -600, -300);
	setScrollFactor('pibby', 0.9, 0.9);
	
	makeLuaSprite('seafront', 'seaground', -650, -350);
	setScrollFactor('seafront', 0.9, 0.9);
	scaleObject('seafront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

		makeLuaSprite('seashade', 'seashade', -500, -300);
		setScrollFactor('seashade', 1.3, 1.3);
		scaleObject('seashade', 0.9, 0.9);
	end

	addLuaSprite('pibby', false);
	addLuaSprite('seafront', false);
	addLuaSprite('seashade', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end