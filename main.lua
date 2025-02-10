-- Assigning Scenes.
gameState = "main"
titleScreen = require("titleScreen")
gameScene = require("gameScene")

function love.load() -- Runs once.
  -- Assigns the game scene and call its load function.
  gameState = titleScreen 
  titleScreen.load() -- Not needed if it's not used in the game scene.
end

function love.update(dt) -- Game logic (FPS)
  -- Checks for the assigned game scene and calls its update function. 
  if gameState == titleScreen then
    titleScreen.update(dt)
  elseif gameState == gameScene then 
    gameScene.update(dt)
  end
end

function love.draw() -- Renders graphics (FPS)
  -- Checks for the assigned game scene and calls its draw function.
  if gameState == titleScreen then
    titleScreen.draw()
  elseif gameState == gameScene then 
    gameScene.draw()
  end
end

function love.keypressed(key) -- LOVE2D doesn't automatically check for key inputs in other files.
  -- Checks for the assigned game scene and calls for its keypressed function.
  if gameState == titleScreen then
      titleScreen.keypressed(key)  
  elseif gameState == gameScene then
      gameScene.keypressed(key)  
  end
end