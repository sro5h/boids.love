local vector2 = {};
local vector2_mt = {__index = vector2};

function vector2.new(x, y)
    local _vector2 = setmetatable({
        x = x or 0.0,
        y = y or 0.0
    }, vector2_mt);

    return _vector2;
end

return vector2;
