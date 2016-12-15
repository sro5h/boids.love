local boid = require("boid");

local app = {};
local app_mt = {__index = app};

-- constants
app.EPSILON = 0.0000001;
app.CIRCLE_SEGMENTS = 30;
app.PLAYER_SIZE = 10;
app.BOID_SIZE = 10;

-- creates new app
function app.new(width, height)
    local _app = setmetatable({
        _width = width,
        _height = height,

        _player = {},
        _boids = {}
    }, app_mt);

    -- create player
    _app._player = boid.new(_app._width / 2, _app._height / 2, app.PLAYER_SIZE, {177, 94, 124});

    -- initial graphics setup
    love.window.setMode(_app._width, _app._height);
    love.graphics.setBackgroundColor(27, 32, 42);
    love.graphics.setLineWidth(0.5);

    return _app;
end

-- draw a boid
local function drawBoid(b)
    love.graphics.setColor(unpack(b:getColor()));
    love.graphics.circle("line", b:getX(), b:getY(), b:getSize(), app.CIRCLE_SEGMENTS);
end

-- draw a player
local function drawPlayer(p)
    love.graphics.setColor(unpack(p:getColor()));
    love.graphics.circle("line", p:getX(), p:getY(), p:getSize(), app.CIRCLE_SEGMENTS);
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
    if(not b) then
        local posX = math.random(0, self._width);
        local posY = math.random(0, self._height);
        self:addBoid(boid.new(posX, posY, app.BOID_SIZE));
    else
        self._boids[#self._boids + 1] = b;
    end
end

-- init
function app:init()
    math.randomseed(os.time());
    for i = 1, 10 do
        myApp:addBoid();
    end
end

-- handleEvents
function app:handleInput()
    self._player:setX(love.mouse.getX());
    self._player:setY(love.mouse.getY());

    -- key presses
    if(love.keyboard.isDown("a")) then
        self:addBoid();
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

    drawPlayer(self._player);
end

return app;
