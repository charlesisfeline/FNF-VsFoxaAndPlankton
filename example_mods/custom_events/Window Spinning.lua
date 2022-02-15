function onEvent()
        speed = 10
        function onUpdate()
	   songPos = getSongPosition()
	   currentBeat = (songPos/5000)*(curBpm/60)

	   setPropertyFromClass('openfl.Lib','application.window.x', math.cos(currentBeat*speed)*screenWidth+1250)
	   setPropertyFromClass('openfl.Lib','application.window.y', math.sin(currentBeat*speed)*(screenHeight/2)+200)
        end
end
