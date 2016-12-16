local vector2 = {};
vector2.__index = vector2;

-- creates a vector2
function vector2.new(x, y)
    local _vector2 = setmetatable({
        x = x or 0.0,
        y = y or 0.0
    }, vector2);

    return _vector2;
end

-- clone the vector2
function vector2:clone()
    return vector2.new(self.x, self.y);
end

-- unpack the vector2
function vector2:unpack()
    return self.x, self.y;
end

-- adds two vector2
function vector2.__add(a, b)
    return vector2.new(a.x + b.x, a.y + b.y);
end

-- subtracts two vector2
function vector2.__sub(a, b)
    return vector2.new(a.x - b.x, a.y - b.y);
end

-- multiplies a vector2 with a number
function vector2.__mul(a, b)
    if(type(a) == "number") then
        return vector2.new(b.x * a, b.y * a);
    elseif(type(b) == "number") then
        return vector2.new(a.x * b, a.y * b);
    end
end

-- divides a vector2 with a number
function vector2.__div(a, b)
    if(type(b) == "number") then
        return vector2.new(a.x / b, a.y / b);
    end
end

-- compares values of two vector2
function vector2.__eq(a, b)
    return (a.x == b.x) and (a.y == b.y);
end

-- compares lengths of two vector2
function vector2.__lt(a, b)
    return a:lengthSq() < b:lengthSq();
end

-- compares lengths of two vector2
function vector2.__le(a, b)
    return a:lengthSq() <= b:lengthSq();
end

-- converts the vector2 to a string
function vector2.__tostring(a)
    return ("(%g,%g)"):format(a.x, a.y);
end

-- calculates the length of the vector2
function vector2:length()
    return math.sqrt(self:dot(self));
end

-- calculates the squred length of the vector2
function vector2:lengthSq()
    return self:dot(self);
end

-- calculates the cross product of v with self
function vector2:cross(a)
    return (self.x * a.x) + (self.y * a.y);
end

-- normalize the vector2
function vector2:normalize()
    local length = self:length();
    self.x = self.x / length;
    self.y = self.y / length;
end

-- return normalized vector2
function vector2:normalized()
    return self / self:length();
end

-- rotate a vector2 by phi
function vector2:rotate(phi)
    local cos = math.cos(phi);
    local sin = math.sin(phi);
    self.x = cos * self.x - sin * self.y;
    self.y = sin * self.x + cos * self.y;
end

-- return perpendicular vector2
function vector2:perpendicular()
    return vector2.new(-self.y, self.x);
end

return vector2;
