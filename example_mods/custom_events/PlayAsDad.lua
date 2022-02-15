--CONFIGURATIONS
local DadSingLength = 0.8 --how long dad's sing animation lingers
local bfSingLength = 0.8 --same thing as dad but with bf
local MissColor = '5f1ea4' --color the dad shifts to when missing a note WHICH CAUSES ALOT OF BUGS SO I MAY REMOVE IT ENTIRLY
local DadSingLengthm = 0.8 --how long the miss animation lingers
local DadSingAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'} --stuff, dont touch
local DadSingAnimsm = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'} -- alot of stuff, dont touch
local singKeys = {'left', 'down', 'up', 'right'} --more stuff, dont touch
local bfSingAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'} --even more stuff, dont touch

local PlayerIsDad = 0

function onEvent(name, value1, value2)
	if name == 'PlayAsDad' then
		if value1 == 'true' then
			noteTweenX('xSwapPlayerL', 4, defaultOpponentStrumX0, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerD', 5, defaultOpponentStrumX1, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerU', 6, defaultOpponentStrumX2, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerR', 7, defaultOpponentStrumX3, 0.2, 'CircInOut')
				
			noteTweenX('xSwapEnemyL', 0, defaultPlayerStrumX0, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyD', 1, defaultPlayerStrumX1, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyU', 2, defaultPlayerStrumX2, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyR', 3, defaultPlayerStrumX3, 0.2, 'CircInOut')
		
			PlayerIsDad = 1
			
			for i = 0, getProperty('unspawnNotes.length')-1 do
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true) --removes le animation
			end
		elseif value1 == 'false' then
			noteTweenX('xSwapPlayerL', 4, defaultPlayerStrumX0, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerD', 5, defaultPlayerStrumX1, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerU', 6, defaultPlayerStrumX2, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerR', 7, defaultPlayerStrumX3, 0.2, 'CircInOut')
				
			noteTweenX('xSwapEnemyL', 0, defaultOpponentStrumX0, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyD', 1, defaultOpponentStrumX1, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyU', 2, defaultOpponentStrumX2, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyR', 3, defaultOpponentStrumX3, 0.2, 'CircInOut')
		
			PlayerIsDad = 0
			
			for i = 0, getProperty('unspawnNotes.length')-1 do
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false) --re adds le animation
			end
		end
	end
end

	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
local DadSingDir = 1
function goodNoteHit(id, direction, noteType, isSustainNote)
	
	if PlayerIsDad == 1 then
		characterPlayAnim('dad', DadSingAnims[direction+1], true)
		runTimer('sing-wait', DadSingLength, 1)
		setProperty('dad.specialAnim',true)
		DadSingDir = direction
	end
	
	if PlayerIsDad == 1 and getProperty('health') > 0.1 then
		setProperty('health', getProperty('health')-0.05)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'sing-wait' then
		setProperty('dad.specialAnim', false)
		setProperty('dad.animation.curAnim.paused', false)
		characterPlayAnim('dad', 'idle', true)
		if loopsLeft < 1 and keyPressed(singKeys[DadSingDir+1]) then
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
			setProperty('dad.animation.curAnim.paused', true)
			setProperty('dad.specialAnim', true)
			runTimer('hold-wait', 0.1, 1)
		end
	end
	if tag == 'hold-wait' then
		if loopsLeft < 1 and keyPressed(singKeys[DadSingDir+1]) then
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
			setProperty('dad.animation.curAnim.paused', true)
			setProperty('dad.specialAnim', true)
			runTimer('hold-wait', 0.1, 1)
			loopsLeft = 1
		elseif loopsLeft < 1 and not keyPressed(singKeys[DadSingDir+1]) then
			setProperty('dad.specialAnim', false)
			setProperty('dad.animation.curAnim.paused', false)
			characterPlayAnim('dad', 'idle', true)
		end
	end
	if tag == 'miss_wait' then
		setProperty('dad.color', 16777215);
	end
	if tag == 'hey' then
		characterPlayAnim('dad', 'hey', true)
	end
	if tag == 'BF_sing-wait' then
		setProperty('boyfriend.specialAnim', false)
		setProperty('boyfriend.animation.curAnim.paused', false)
		characterPlayAnim('boyfriend', 'idle', true)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
	if PlayerIsDad == 1 then
		characterPlayAnim('dad', DadSingAnims[direction+1], true)
		setProperty('dad.color', getColorFromHex(MissColor));
		runTimer('miss_wait', DadSingLength, 1)
		characterPlayAnim('boyfriend', 'idle', true)
		setProperty('dad.specialAnim',true)
		if getProperty('health') < 1.9 then
			setProperty('health', getProperty('health')+0.07)
		end
	end
end

function noteMissPress(direction)
	-- Called after the note press miss calculations
	-- Player pressed a button, but there was no note to hit (ghost miss)
	if PlayerIsDad == 1 then
		setProperty('dad.color', getColorFromHex(MissColor));
		characterPlayAnim('dad', DadSingAnims[direction+1], true)
		runTimer('miss_wait', DadSingLength, 1)
		characterPlayAnim('boyfriend', 'idle', true)
		setProperty('dad.specialAnim',true)
		if getProperty('health') < 1.9 then
			setProperty('health', getProperty('health')+0.07)
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --makes player sing when dad hits a note

	if PlayerIsDad == 1 then
		characterPlayAnim('boyfriend', bfSingAnims[direction+1], true);
		runTimer('BF_sing-wait', bfSingLength, 1);
		setProperty('boyfriend.specialAnim', true);
	end
	
	if PlayerIsDad == 1 and getProperty('health') < 1.9 then
		setProperty('health', getProperty('health')+0.02)
	end
end