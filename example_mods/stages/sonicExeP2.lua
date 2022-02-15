local t = 0
local s = 0
function onCreate()
    makeLuaSprite('bg', 'exep3/Glitch', -621, -365)
    addLuaSprite('bg', false)
    setGraphicSize('bg', getProperty('bg.width') * 1.2)

    makeAnimatedLuaSprite('plasticShit', 'exep3/NewTitleMenuBG', 0, 0)
    addAnimationByPrefix('plasticShit', 'ImGonnaDie', 'TitleMenuSSBG instance 1', 24, true)
    setGraphicSize('plasticShit', getProperty('plasticShit.width') * 4.5)
    setProperty('plasticShit.visible', false)
    addLuaSprite('plasticShit', false)

    makeLuaSprite('trees1', 'exep3/Trees', -607, -401)
    addLuaSprite('trees1')
    setScrollFactor('trees1', 0.95, 1)
    setGraphicSize('trees1', getProperty('trees1.width') * 1.2)

    makeLuaSprite('trees2', 'exep3/Trees2', -623, -410)
    setGraphicSize('trees2', getProperty('trees2.width') * 1.2)
    addLuaSprite('trees2', false)

    makeLuaSprite('grass', 'exep3/Grass', -630, -266)
    addLuaSprite('grass', false)
    setGraphicSize('grass', getProperty('grass.width') * 1.2)
end

function onCreatePost()
    setProperty('gf.alpha', 0)
end