-- Lua Tutorial #24, The Debug Library

function f(x)
  
  print(x)
  
end

-- debug this

t = debug.getinfo(f)

for k,v in pairs(t) do
  print(k,v)
end


print("debugging inside of functions")

function f(x)
  local y = 10
  local z = 50
  -- 1 = x, 2 = y, 3 = next local var etc
  -- the first value is the position of the function in the stack
  name, value = debug.getlocal(2,1)
  print(name,value)
end

f(10)

function g()
  local x = 70
  f(16)
end

g()


-- tweak values of local variables from outside of the enclosing function
print("attempting to tweak a local var from outside its function")

function f1(x)
  local y = 50
  local z = 100
  -- adjust a local value for the function that called us
  debug.setlocal(2, 1, 188)
end

function g1()
  local x = 120
  f1(16)
  print("local x in g1 is now", x)
end

-- call g1
g1()

-- hooks

-- turn on the line printing function
-- l = line, c = call, r = return
-- debug.sethook(print, "c")


local x = 10
function f2()
  print("from inside of f2, x is", x)
end

name,value = debug.getupvalue(f2, 2)
print(name,value)

debug.setupvalue(f2, 2, 190)
f2()

print("counting hook")
-- counting
-- debug.sethook(print, "", 2)

print(3)
print(9)
print(0)


-- opens a separate debug console
debug.debug()


