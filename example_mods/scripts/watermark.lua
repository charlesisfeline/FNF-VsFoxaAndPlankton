currentDifficulty = 'its still freaked';
currentSongLength = 'what';
storyMode = 'freeplay';

function onCreate()
makeLuaText('songText', songName .. " " .. currentDifficulty .. " // Playing as " .. getProperty('boyfriend.curCharacter') .. " // FNF VsFoxa&Plankton Plankton Update (PE 0.5.1)", 0, 2, 700);
setTextAlignment('songText', 'right');
setTextSize('songText', 15);
setTextBorder('songText', 1, '000000');
setTextFont('songText', 'vcr.ttf');
addLuaText('songText');
end

function onCreatePost()
setProperty('timeBar.y', getProperty('timeBar.y') - 10);
setProperty('timeTxt.y', getProperty('timeTxt.y') - 10);
end

function onUpdate(elapsed)
currentDifficulty = getProperty('storyDifficultyText');
storyMode = getProperty('isStoryMode');
setTextString('songText', songName .. " " .. currentDifficulty .. " // Playing as " .. getProperty('boyfriend.curCharacter') .. " // FNF VsFoxa&Plankton Plankton Update (PE 0.5.1)");
end

