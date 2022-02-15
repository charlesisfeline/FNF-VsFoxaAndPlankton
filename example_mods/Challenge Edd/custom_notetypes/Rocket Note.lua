function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Rocket Note' then --Check if the note on the chart is a Bullet Note
			if not downscroll then 
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/Rocket Note'); --Change texture
			elseif downscroll then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/DS Rocket Note'); --DownScroll Texture
			end
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notes/Explosion'); --custom notesplash texture and its not playing animation

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Rocket Note' then
		setProperty('health', -1);
	end
end