local app = require "app";

-- constants
SCREEN_SIZE = 600;

function love.load()
    -- initial graphics setup
    myApp = app.new(SCREEN_SIZE, SCREEN_SIZE);
end

function love.update(dt)
    myApp:handleInput();
    myApp:update(dt);
end

function love.draw()
    myApp:draw();
end
