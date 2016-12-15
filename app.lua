local boid = require("boid");

local app = {};
local app_mt = {__index = app};

-- constants
app.EPSILON = 0.0000001;
app.CIRCLE_SEGMENTS = 30;
app.DEFAULT_COLOR = { 96, 140, 195};

-- creates new app
function app.new(width, height)
    local _app = setmetatable({
        _width = width,
        _height = height,

        _boids = {}
    }, app_mt);

    -- initial graphics setup
    love.window.setMode(_app._width, _app._height);
    love.graphics.setBackgroundColor(27, 32, 42);
    love.graphics.setLineWidth(0.5);

    return _app;
end

-- draw a boid
local function drawBoid(b)
    -- check if color is nil
    if(b:getColor()) then
        love.graphics.setColor(unpack(b:getColor()));
    else
        love.graphics.setColor(unpack(app.DEFAULT_COLOR));
    end
    love.graphics.circle("line", b:getX(), b:getY(), b:getSize(), app.CIRCLE_SEGMENTS);
end

-- get the width
function app:getWidth()
    return self._width;
end

-- get the height
function app:getHeight()
    return self._height;
end

-- add a boid to _boids
function app:addBoid(b)
    self._boids[#self._boids + 1] = b;
end

-- handleEvents
function app:handleInput()
    if(love.keyboard.isDown("a")) then
        print("a pressed");
    end
    if(love.keyboard.isDown("w")) then
        print("w pressed");
    end
    if(love.keyboard.isDown("d")) then
        print("d pressed");
    end
    if(love.keyboard.isDown("s")) then
        print("s pressed");
    end
end

-- update
function app:update(dt)

end

-- draw
function app:draw()
    for key, b in pairs(self._boids) do
        drawBoid(b);
    end
end

return app;
