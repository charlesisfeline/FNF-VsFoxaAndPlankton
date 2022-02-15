local allowCountdown = false

local whichDialougeLine = 1

--my code is genuinely horrible, but it works
-- ignore all the unnecessary prints LMAO

function setDaShits()
	setProperty("healthBarBG.visible", "false")
		setProperty("healthBar.visible", "false")
		setProperty("iconP1.visible", "false")
		setProperty("iconP2.visible", "false")
		setProperty("scoreTxt.visible", "false")
		setProperty("dad.visible", "false")
		setProperty("gf.visible", "false")
		setProperty("boyfriend.visible", "false")
		setProperty("doof.visible", "false")
end

function unsetDaShits()
	setProperty("healthBarBG.visible", "true")
		setProperty("healthBar.visible", "true")
		setProperty("iconP1.visible", "true")
		setProperty("iconP2.visible", "true")
		setProperty("scoreTxt.visible", "true")
		setProperty("dad.visible", "true")
		setProperty("gf.visible", "true")
		setProperty("boyfriend.visible", "true")
		setProperty("DialogueBoxPsych.DialogueCharacter", "visible", "false")
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
	--	setDaShits();
		setPropertyFromClass("DialogueBoxPsych", "bgFade.alpha", 0); -- WHY WONT THIS SHIT WORK :(A)
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('inCutscene', false);
	removeLuaSprite("cut");
	unsetDaShits();
	return Function_Continue;
end

function onUpdate(elapsed)

	local incutlmao = getProperty("inCutscene");

	if incutlmao == true then
		setDaShits();
	end
	if incutlmao == false then	
		unsetDaShits();
	end
end

--function onCreate()
--	local idfk = getPropertyFromClass("StrumNote", "player");
--	for i = 0, getProperty('unspawnNotes.length')-1 do
	--	if idfk == 0 then
	--	setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets2');
	--	end
	--end
	--print (idfk);
--end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'givinALittle');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
	whichDialougeLine = whichDialougeLine + 1;
	-- print(whichDialougeLine);

	local daSong = string.lower(songName)

    makeLuaSprite("cut", 'cutscenes/' .. daSong .. '/CUT' .. whichDialougeLine, -100, -50);
	print("mods/".. daSong .. "/script.lua: ".. "loaded the fuckin current cutscene: " .. 'cutscenes/' .. daSong .. '/CUT' .. whichDialougeLine);
	setPropertyFromClass("DialogueBoxPsych", "bgFade.alpha", 0); -- WHY WONT THIS SHIT WORK :(A)
	-- it will give haxe errors on the debug but since ur on psych lua ur most likely not on debug, it only gives errorss iff the cutscene image dont exist
	addLuaSprite("cut")
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
    print("MOTHERFUCKER SKIPPED DIALOGUE ;(")
end