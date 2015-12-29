--L Lua Tutorial #14, part 2

--_ENV = {g = _G}

--x = 10
--local y = 1
--local z = 2
--a = 5

--x = 10
--local x = 1

--print(x)
--print(_ENV.x)

--for k, v in g.pairs(_ENV) do
--  g.print(k, v)
--end

-- This works outside of ZeroBrane...


x = 10
print(x)

local function f()
  local _ENV = {print = print, x = 50}
  print(x)
end

f()

print(x)

