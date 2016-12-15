local app = require("app");
local boid = require("boid");

-- constants
SCREEN_SIZE = 600;
BOID_SIZE = 10;

function love.load()
    -- initial graphics setup
    myApp = app.new(SCREEN_SIZE, SCREEN_SIZE);
    myApp:addBoid(boid.new(40, 50, BOID_SIZE, {177, 94, 124}));
end

function love.update(dt)
    myApp:handleInput();
    myApp:update(dt);
end

function love.draw()
    myApp:draw();
end
