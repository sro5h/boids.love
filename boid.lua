local vector2 = require("vector2");

local boid = {};
boid.__index = boid;

-- constants
boid.DEFAULT_COLOR = {96, 140, 195};

-- creates a new boid
function boid.new(x, y, size, color)
    local _boid = setmetatable({
        _position = vector2.new(x, y),
        _size = size or 20,
        _color = color or boid.DEFAULT_COLOR
    }, boid);

    return _boid;
end

-- get the position as vector2
function boid:getPos()
    return self._position;
end

-- set the position by vector2 or value
function boid:setPos(vecOrX, y)
    if(type(vecOrX) == "number") then
        self._position.x = vecOrX;
        self._position.y = y;
    else
        self._position = vecOrX;
    end
end

-- get the size
function boid:getSize()
    return self._size;
end

-- set the size
function boid:setSize(size)
    self._size = size;
end

-- get the color
function boid:getColor()
    return self._color;
end

-- set the color
function boid:setColor(color)
    self._color = color;
end

return boid;
