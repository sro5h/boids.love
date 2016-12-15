local app = require("app");
local boid = require("boid");

-- constants
SCREEN_SIZE = 600;

function love.load()
    -- initial graphics setup
    myApp = app.new(SCREEN_SIZE, SCREEN_SIZE);
    myApp:init();
end

function love.update(dt)
    myApp:handleInput();
    myApp:update(dt);
end

function love.draw()
    myApp:draw();
end
