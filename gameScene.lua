gameScene = {} -- Creates an empty table.

function gameScene.load() -- Optional. 
  -- Window adjustments (Can be set in main.lua as well.)
  windowWidth, windowHeight = 1280, 780
  love.window.setTitle("Game Scene")
  love.window.setMode(windowWidth, windowHeight)
  love.graphics.setBackgroundColor(0.129, 0.4, 0.427)
  love.graphics.setFont(love.graphics.newFont(40))
end

function gameScene.update(dt) -- Game logic (FPS)
end

function gameScene.draw() -- Renders graphics (FPS)
  love.graphics.printf("Game Scene...", 0, windowHeight / 2, windowWidth, "center")
end

-- Checks for a key input, assigns the game scene and calls its load function. 
function gameScene.keypressed(key)
  if key == "space" then
    gameState = titleScreen
    titleScreen.load() -- Not needed if it's not used in the game scene.
  end
end

return gameScene -- Returns the table.
