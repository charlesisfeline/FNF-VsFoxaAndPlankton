function onCreate()
	precacheImage('DoorOpen')
	precacheImage('Matt')
	precacheImage('Tom')
	makeAnimationList();
	-- background shit
	makeLuaSprite('sky', 'SkyBox', -1790, -800);
	setScrollFactor('sky', 0.1, 0.5);
	
	makeLuaSprite('cloud', 'Clouds', -2590, -500);
	setScrollFactor('cloud', 0.1, 0.3);
	setProperty('cloud.velocity.x', math.random(5, 15));
	
	makeLuaSprite('houses', 'HousesAndFloor', -1790, -600);
	setScrollFactor('houses', 1, 1);
	
	if not lowQuality then
		makeAnimatedLuaSprite('doorOpen', 'DoorOpen', 600, 300); -- from that door on Hard comes up Matt with Tom
		addAnimationByPrefix('doorOpen', 'open', 'Door Opening', 12, false)
		setScrollFactor('doorOpen', 1, 1);
		setProperty('doorOpen.alpha', 0);
		scaleObject('doorOpen', 1.3, 1.3);
	
		makeLuaSprite('city', 'SecondParalax', -1290, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.8, 0.8);
		
		makeAnimatedLuaSprite('matt', 'Matt', 560, 245); -- matt !!
		addAnimationByPrefix('matt', 'walk', 'MattWalking', 24, true)
		addAnimationByPrefix('matt', 'idle', 'MattSnappingFinger', 24, true)
		addAnimationByPrefix('matt', 'reaction', 'MattReaction', 24, false)
		addAnimationByPrefix('matt', 'idol', 'MattPISSED', 24, false)
		setScrollFactor('matt', 1, 1);
		setProperty('matt.alpha', 0);
		scaleObject('matt', 1.5, 1.5);
		
		makeAnimatedLuaSprite('tom', 'Tom', 610, 245); -- tom !!
		addAnimationByPrefix('tom', 'walk', 'TomWalkingBy', 24, true)
		addAnimationByPrefix('tom', 'trans', 'TomTransition', 24, false)
		addAnimationByPrefix('tom', 'idle', 'TomIdle', 24, true)
		addAnimationByPrefix('tom', 'lookin', 'TomLooking', 24, false)
		addAnimationByPrefix('tom', 'idol', 'TomIdol', 24, false)
		addAnimationByPrefix('tom', 'reaction', 'TomReaction', 24, false)
		setScrollFactor('tom', 1, 1);
		setProperty('tom.alpha', 0);
		scaleObject('tom', 1.5, 1.5);
		
		makeAnimatedLuaSprite('john', 'John', -915, 205); -- john
		addAnimationByPrefix('john', 'idle', 'JohnIdle', 24, false)
		setScrollFactor('john', 1, 1);
		setProperty('john.alpha', 0);
		scaleObject('john', 0.9, 0.9);
		
		makeAnimatedLuaSprite('mark', 'Mark', -760, 245); -- mark
		addAnimationByPrefix('mark', 'idle', 'MarkIdle', 24, false)
		setScrollFactor('mark', 1, 1);
		setProperty('mark.alpha', 0);
		scaleObject('mark', 0.8, 0.8);
		
		makeLuaSprite('car', 'Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
	end
	
	makeLuaSprite('fence', 'Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);

	addLuaSprite('sky', false); --bg
	addLuaSprite('cloud', false);
	addLuaSprite('plane', false);
	addLuaSprite('city', false);
	addLuaSprite('houses', false);
	addLuaSprite('doorOpen', false);
	
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('matt', false); -- matt
	addLuaSprite('tom', false); --tom
	
	addLuaSprite('car', true);
end

function onStepHit()
	if curStep == 272 then -- matt coming up
		objectPlayAnimation('doorOpen', 'open', true)
		setProperty('doorOpen.alpha', 1);
		runTimer('doorGoesInvis', 1, 1)
		setProperty('matt.alpha', 1);
		doTweenX('MattTweenX', 'matt', 10, 1.9);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'doorGoesInvis' then
				setProperty('doorOpen.alpha', 0);
			end
		end
	end
	if curStep == 416 then -- tom coming up
		setProperty('doorOpen.alpha', 1);
		objectPlayAnimation('doorOpen', 'open', true)
		runTimer('doorGoesInvis', 1, 1)
		setProperty('tom.alpha', 1);
		setProperty('tom.flipX', true);
		doTweenX('tomTweenX', 'tom', 1390, 4.8);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'doorGoesInvis' then
				setProperty('doorOpen.alpha', 0);
			end
		end
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat % 2 == 0 and curStep > 289 and curStep < 912 then
		objectPlayAnimation('matt', 'idle', true);
	end
	if curBeat % 2 == 0 and curStep > 478 then
		objectPlayAnimation('tom', 'idle', true);
	end
end

function onTweenCompleted(tag) 
	if tag == 'PlaneTweenX' then
		removeLuaSprite('plane', true); -- optimization
	end
	if tag == 'MattTweenX' then
		objectPlayAnimation('matt', 'idle', true)
		setProperty('matt.x', -120); -- offset
	end
	if tag == 'tomTweenX' then
		objectPlayAnimation('tom', 'trans', true);
		setProperty('tom.flipX', false);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'tomIdle' then
		objectPlayAnimation('tom', 'idle', true);
	end
end
