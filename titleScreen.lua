titleScreen = {} -- Creates an empty table.

function titleScreen.load() -- Optional.
  -- Window adjustments (Can be set in main.lua as well.)
  windowWidth, windowHeight = 800, 600
  love.window.setTitle("Scene Manager")
  love.window.setMode(windowWidth, windowHeight)
  love.graphics.setBackgroundColor(0.129, 0.3, 0.427)
  love.graphics.setFont(love.graphics.newFont(20))
end

function titleScreen.update(dt) -- Game logic (FPS)
end

function titleScreen.draw() -- Renders graphics (FPS)
  love.graphics.printf("Title Screen...", 0, windowHeight / 2, windowWidth, "center") -- Sample Text.
end

-- Checks for a key input, assigns the game scene and calls its load function. 
function titleScreen.keypressed(key)
  if key == "space" then
    gameState = gameScene
    gameScene.load() -- Not needed if it's not used in the game scene.
  end
end

return titleScreen -- Returns an empty table.