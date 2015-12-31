-- complex module example
-- keep M local to this module only
local M = {}
-- setmetatable(M, {__index = _G})
-- restrict the environment access from this module

-- only allow specific globals
-- local print = print

local mabs = math.abs
local sqrt = math.sqrt

_ENV = M

--printHello = function()
--  print("Hello from inside the module!")
--end

-- M.pi = 3.14159

-- M.t = { 1, 2, 3 }

new = function(real, img)
  return {r = real, i = img}
end

i = new(0, 1)

add = function(c1, c2)
  return {r = c1.r + c2.r, i = c1.i + c2.i}
end

sub = function(c1, c2)
  return {r = c1.r - c2.r, i = c1.i - c2.i}
end

mul = function(c1, c2)
  return {r = c1.r * c2.r - c1.i * c2.i, i = c1.r * c2.i + c1.i * c2.r}
end

abs = function(c1)
  return mabs(sqrt(c1.r * c1.r + c1.i * c1.i))
end

return M

