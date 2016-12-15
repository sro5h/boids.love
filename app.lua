local app = {};

local app_mt = {__index = app};

-- constants
app.EPSILON = 0.0000001;

-- creates new app
function app.new(width, height)
    local _app = setmetatable({
        _width = width;
        _height = height;
    }, app_mt);

    -- initial graphics setup
    love.window.setMode(_app._width, _app._height);
    love.graphics.setBackgroundColor(27, 32, 42);

    return _app;
end

-- get the width
function app:getWidth()
    return self._width;
end

-- get the height
function app:getHeight()
    return self._height;
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

function app:draw()

end

return app;
