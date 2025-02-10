# A Simple LÖVE Scene Manager  

An easy and lightweight scene manager for LÖVE2D.  

## 📌 Features:  
- Easy scene switching  
- Supports multiple scenes (e.g., `titleScreen`, `gameScene`)  
- Lightweight and efficient  

---  

## 🏗️ main.lua  

### 🔹 Loading Scenes  
Every scene is loaded from `main.lua`:  
gameState = "main" -- This is the current scene.  
titleScreen = require("titleScreen")  
gameScene = require("gameScene")  

### 🔹 Initial Scene Assignment  
`main.lua` will instantly load the assigned scene:  
function love.load() -- Runs once.  
    -- Assigns the game scene and calls its load function.  
    gameState = titleScreen  
    titleScreen.load() -- Not needed if it's not used in the game scene.  
end  

### 🔹 Handling Input in Main  
LÖVE2D doesn't automatically check for inputs in other files, so functions like these must be added in `main.lua`:  
function love.keypressed(key)  
    if gameState == titleScreen then  
        titleScreen.keypressed(key)  
    elseif gameState == gameScene then  
        gameScene.keypressed(key)  
    end  
end  

### 🔹 Function Naming Differences  
LÖVE's built-in functions are different in `main.lua` and other scene files:  
-- main.lua uses:  
love.load()  
love.update(dt)  
love.draw()  
love.keypressed(key)  

-- Other scene files use:  
scene.load()  
scene.update(dt)  
scene.draw()  
scene.keypressed(key)  

---  

## 📂 Other Scene Files (`titleScreen.lua`, `gameScene.lua`)  

### 🔹 Scene File Structure  
Make sure your scene files follow this structure:  
titleScreen = {}  

-- Everything in between.  

return titleScreen  

### 🔹 Overriding `load()` (Optional)  
You only need the `.load()` function **if you want to override** `main.lua`'s `love.load()`:  
function titleScreen.load() -- Optional.  
    -- Custom scene-specific settings  
end  

### 🔹 Scene Switching  
When switching scenes from `main.lua`, functions like `titleScreen.update(dt)` and `titleScreen.draw()` are called within similar functions in `main.lua`.  

However, **only the `.load()` of the first assigned scene will be called in `love.load()`**. To call another `.load()` manually, do this inside a scene:  
function titleScreen.keypressed(key)  
    if key == "space" then  
        gameState = gameScene  
        gameScene.load() -- Not needed if it's not used in the game scene.  
    end  
end  

---  

## ⚠️ **Important Notes**  
- Pressing the `Space` key switches scenes (`titleScreen` ↔ `gameScene`).  
- **Game flickers on scene switch** because `love.load()` is re-executed, resetting settings like window size and background color.  
- **To avoid flickering**, remove or comment out `titleScreen.load()` and `gameScene.load()`.  
  This ensures settings from `main.lua` persist.  

---  

## 🎮 **Final Thoughts**  
I hope this helps fellow LÖVE developers and beginners like me!  
Happy coding!~ (✿◡‿◡)  
