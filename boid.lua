local boid = {};
local boid_mt = {__index = boid};

-- creates a new boid
function boid.new(x, y, size, color)
    local _boid = setmetatable({
        _x = x,
        _y = y,
        _size = size or 20,
        _color = color
    }, boid_mt);

    return _boid;
end

-- get the x value
function boid:getX()
    return self._x;
end

-- set the x value
function boid:setX(x)
    self._x = x;
end

-- get the y value
function boid:getY()
    return self._y;
end

-- set the y value
function boid:setY(y)
    self._y = y;
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
