function onCreate()
	precacheImage('DoorOpen')
	precacheImage('Matt')
	precacheImage('Fallin')
	precacheImage('character/Tord')
	precacheImage('character/Tord2')
	precacheImage('character/SlideEdd')
	precacheImage('character/SlideBF')
	precacheImage('character/EddTordCutscene')
	precacheImage('character/BFTordCutscene')
	precacheImage('character/DEdd')
	precacheImage('notes/Explosion')
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
	
		makeLuaSprite('city', 'SecondParalax', -1390, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.9, 0.8);
		
		makeAnimatedLuaSprite('matt', 'Matt', 560, 245); -- matt !!
		addAnimationByPrefix('matt', 'walk', 'MattWalking', 24, true)
		addAnimationByPrefix('matt', 'idle', 'MattSnappingFinger', 24, false)
		addAnimationByPrefix('matt', 'reaction', 'MattReactionTord', 24, false)
		addAnimationByPrefix('matt', 'lookin', 'MattHarpoonBit', 24, false)
		addAnimationByPrefix('matt', 'lookidle', 'MattHarpoonIdle', 24, true)
		setScrollFactor('matt', 1, 1);
		setProperty('matt.alpha', 0);
		scaleObject('matt', 1.5, 1.5);
		
		makeAnimatedLuaSprite('tom', 'TomEND', 1210, 299); -- tom !!
		addAnimationByPrefix('tom', 'walk', 'Tom Running In', 24, false)
		addAnimationByPrefix('tom', 'harp', 'TomHarpoonLine', 24, false)
		addAnimationByPrefix('tom', 'harpidle', 'TomHarpoonIdle', 24, true)
		setScrollFactor('tom', 1, 1);
		setProperty('tom.alpha', 0);
		scaleObject('tom', 1.5, 1.5);
		
		makeLuaSprite('car', 'Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
		
		makeLuaSprite('plane', 'Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
		
		makeAnimatedLuaSprite('tord', 'TordHelicopter', 1270, -45); -- this red mf
		addAnimationByIndices('tord', 'idle', 'TordHelicopter', '1, 2', 12)
		addAnimationByPrefix('tord', 'mama', 'TordHelicopter', 24, false)
		setScrollFactor('tord', 0.2, 0.6);
		setProperty('tord.alpha', 0);
		scaleObject('tord', 2, 2);
		
		makeAnimatedLuaSprite('tord2', 'TordFallin', 600, -845); -- this red mf fallin
		addAnimationByPrefix('tord2', 'idle', 'TordFlailing', 24, true)
		setScrollFactor('tord2', 0.9, 0.9);
		setProperty('tord2.alpha', 0);
		scaleObject('tord2', 1.6, 1.6);
		
		if not downscroll then
			makeAnimatedLuaSprite('expl', 'notes/Explosion', 760, -110); -- explosion after rocket note
			addAnimationByPrefix('expl', 'idle', 'Explosion', 20, false)
			setScrollFactor('expl', 0, 0);
			setProperty('expl.alpha', 0);
			scaleObject('expl', 1.5, 1.5);
			setObjectCamera('expl', 'other')
		elseif downscroll then
			makeAnimatedLuaSprite('expl', 'notes/Explosion', 760, 350); -- explosion after rocket note
			addAnimationByPrefix('expl', 'idle', 'Explosion', 20, false)
			setScrollFactor('expl', 0, 0);
			setProperty('expl.alpha', 0);
			scaleObject('expl', 1.5, 1.5);
			setObjectCamera('expl', 'other')
		end
	end
		
	makeAnimatedLuaSprite('tordbot', 'TordBot', 340, -145); -- this red mf
	addAnimationByPrefix('tordbot', 'idle', 'TordBot0', 24, true)
	addAnimationByPrefix('tordbot', 'explode', 'TordBotBlowingUp', 24, true)
	addAnimationByIndices('tordbot', 'blowidle', 'TordBotBlowingUp', '1, 2', 24)
	setScrollFactor('tordbot', 0.9, 0.9);
	scaleObject('tordbot', 1.3, 1.3);
	
	makeLuaSprite('fence', 'Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);
	
	makeLuaSprite('tordBG', 'TordBG', -100, -200);
	setScrollFactor('tordBG', 0, 0);
	scaleObject('tordBG', 0.5, 0.5);
	setProperty('tordBG.alpha', 0);
	
	makeLuaSprite('cock', 'CockPitUpClose', -20, -40);
	setScrollFactor('cock', 0, 0);
	scaleObject('cock', 0.6, 0.6);
	setProperty('cock.alpha', 0);

	addLuaSprite('sky', false); --bg
	addLuaSprite('cloud', false);
	addLuaSprite('plane', false);
	addLuaSprite('tord', false);
	addLuaSprite('city', false);
	addLuaSprite('tordbot', false);
	addLuaSprite('tord2', false);
	addLuaSprite('houses', false);
	addLuaSprite('doorOpen', false);
	
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('matt', false); -- matt
	addLuaSprite('tom', true); --tom
	
	addLuaSprite('car', true);
	addLuaSprite('tordBG', false);
	addLuaSprite('cock', true);
	
	addLuaSprite('expl', true);
end

function onStepHit()
	if curStep == 144 then -- tord plane comin
		doTweenX('PlaneTweenX', 'plane', 1600, 25);
	end
	if curStep == 272 then -- matt coming up
		objectPlayAnimation('doorOpen', 'open', true)
		setProperty('doorOpen.alpha', 1);
		runTimer('doorGoesInvis', 1, 1)
		setProperty('matt.alpha', 1);
		doTweenX('MattTweenX', 'matt', 10, 1.9);
	end
	if curStep == 397 then -- tord comnin
		doTweenY('TordTweenY', 'tord', 110, 2, 'cubeIn');
		objectPlayAnimation('tord', 'idle', true)
		setProperty('tord.alpha', 1);
	end
	if curStep == 928 then -- tordbot comnin
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.2, 'linear')
		objectPlayAnimation('matt', 'reaction', true);
		setProperty('cameraSpeed', getProperty('cameraSpeed') - 0.8)
		doTweenY('TordbotTweenY', 'tordbot', -615, 5.1);
	end
	if curStep == 936 then -- tordbot comnin
		setProperty('tom.alpha', 1);
		objectPlayAnimation('tom', 'walk', true);
	end
	if curStep == 1020 then -- tordbot comnin
		doTweenZoom('FunnyZoomin', 'camGame', 1.3, 0.7, 'cubeOut');
		setProperty('defaultCamZoom', 1.3);
	end
	if curStep == 1024 then -- inside tordbot intro
		doTweenAlpha('hudFunne', 'camHUD', 1, 1, 'linear')
		setProperty('cameraSpeed', 3);
		setProperty('cock.alpha', 1);
		doTweenAlpha('cockTweenalfa', 'cock', 0, 0.7);
		setProperty('tordBG.alpha', 1);
		setProperty('gf.y', -900); -- tord as gf
		setProperty('gf.x', 100); -- tord as gf
	end
	if curStep == 1132 then -- slide edd
		setProperty('dad.y', -100);
		setProperty('dad.x', 50);
	end
	if curStep == 1260 then -- slide bf
		setProperty('boyfriend.y', -300);
		setProperty('boyfriend.x', 1150);
	end
	if curStep == 1312 then -- offsets reason of cuz 'change character' event changing it
		setProperty('gf.y', -925); -- tord as gf
		setProperty('gf.x', 85); -- tord as gf
	end
	if curStep == 1327 then -- offsets reason of cuz 'change character' event changing it
		setProperty('gf.y', -900); -- tord as gf
		setProperty('gf.x', 100); -- tord as gf
	end
	if curStep == 1984 then -- offsets reason of cuz 'change character' event changing it
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.2, 'linear')
		setProperty('gf.y', -925); -- tord as gf
		setProperty('gf.x', 85); -- tord as gf
	end
	if curStep == 2016 then -- camera getin out of tordbot
		objectPlayAnimation('tordbot', 'blowidle', true)
		setProperty('tordbot.x', -220); -- animation offset
		setProperty('tordbot.y', -880); -- animation offset
		doTweenX('tordbotShakeX', 'tordbot', -230, 0.1);
		setProperty('gf.y', 130); -- gf comin home
		setProperty('gf.x', 460); -- gf comin home
		removeLuaSprite('tordBG'); --optimization!!
		doTweenZoom('FunnyZoomin', 'camGame', 0.7, 0.3);
		setProperty('defaultCamZoom', 0.7);
		setProperty('cameraSpeed', getProperty('cameraSpeed') - 0.4);
		setProperty('cock.alpha', 1);
		doTweenAlpha('cockTweenalfa', 'cock', 0, 0.3);
	end
	if curStep == 2032 then -- KABOOOM
		runTimer('tordbotExploded', 0.7, 1)
		objectPlayAnimation('tordbot', 'explode', true)
		setProperty('tom.x', 700); --offset
		setProperty('matt.x', 100); --offset
		setProperty('cameraSpeed', 0.2);
	end
	if curStep == 2047 then -- camera slow movin shit
		objectPlayAnimation('tom', 'harpidle', true)
		objectPlayAnimation('matt', 'lookidle', true)
		setProperty('tord2.alpha', 1);
		doTweenY('tordFallinAgainTweenY', 'tord2', 400, 1.5, 'linear');
	end
	if curStep == 2078 then -- tom sayin funny wors
		objectPlayAnimation('matt', 'lookin', true)
		setProperty('matt.x', 35); --offset
	end
	if curStep == 2087 then -- tom sayin funny wors
		objectPlayAnimation('tom', 'harp', true)
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat % 2 == 0 and curStep > 292 and curStep < 929 then
		objectPlayAnimation('matt', 'idle', true);
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote) --slide bf and slide edd inside tordbot
	if noteType == 'Special Sing' and boyfriendName == 'slide-bf' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf');
		doTweenY('BfTweenY', 'boyfriend', -570, 0.1, 'cubeIn');
		doTweenX('BfTweenX', 'boyfriend', 930, 0.1, 'cubeIn');
	end
	if noteType == 'Rocket Note' then
		setProperty('expl.alpha', 1);
		objectPlayAnimation('expl', 'idle', true)
		runTimer('boom', 0.3, 1)
	end
	if noteType == 'Opponent Sing' and dadName == 'slide-edd' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'edd-dead');
		doTweenY('EddTweenY', 'dad', -470, 0.1, 'cubeIn');
		doTweenX('EddTweenX', 'dad', 230, 0.1, 'cubeIn');
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --health drain by tord
	if gfName == 'tord' then
		triggerEvent('Screen Shake', '0.1, 0.002', '0.1, 0.001');
		setProperty("health", getProperty("health") - 0.03)
		if getProperty("health") < 0.2 then
			setProperty("health", 0.2)
		end
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
	if tag == 'TordTweenY' then
		doTweenY('Tord2TweenY', 'tord', 510, 10, 'linear');
		objectPlayAnimation('tord', 'mama', true)
	end
	if tag == 'Tord2TweenY' then
		removeLuaSprite('tord');  -- optimization
	end
	if tag == 'tordFallinAgainTweenY' then
		removeLuaSprite('tord2');  -- optimization
	end
	if tag == 'tordbotShakeX' and curStep < 2033 then
		doTweenX('tordbotShakinX', 'tordbot', -210, 0.1);
	end
	if tag == 'tordbotShakinX' and curStep < 2033 then
		doTweenX('tordbotShakeX', 'tordbot', -230, 0.1);
	end
	if tag == 'BfTweenX' then
		runTimer('slideBf', 0.2, 1)
	end
	if tag == 'EddTweenX' then
		runTimer('slideEdd', 0.2, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'doorGoesInvis' then
		setProperty('doorOpen.alpha', 0);
	end
	if tag == 'tordbotExploded' then
		removeLuaSprite('tordbot'); --optimization
	end
	if tag == 'boom' then
		setProperty('expl.alpha', 0);
	end
	if tag == 'slideEdd' and curStep < 1984 then
		doTweenY('EddTweenY', 'dad', -300, 1, 'cubeIn');
		doTweenX('EddTweenX', 'dad', 0, 1, 'cubeIn');
	end
	if tag == 'slideBf' and curStep < 1984 then
		doTweenY('BfTweenY', 'boyfriend', -300, 1, 'cubeIn');
		doTweenX('BfTweenX', 'boyfriend', 1150, 1, 'cubeIn');
	end
end