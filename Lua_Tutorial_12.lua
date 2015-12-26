-- Lua Tutorial #12 - Running external code


--dofile, loadfile. load

-- dofile loads and executes
-- dofile("/Users/biff/Dropbox/LuaStuff/external.lua")

-- loadfile - just loads it and turns it into a function
f = loadfile("/Users/biff/Dropbox/LuaStuff/external.lua")

-- call the new function

-- f()

external = "/Users/biff/Dropbox/LuaStuff/external.lua"


function newDoFile(filename)
  
  f = assert(loadfile(filename))
  -- return the return value of the external function
  return f()

end

print(newDoFile(external))

-- encapsulating a function in a string

f = load("print(20)")

f()

-- nuances with local variables

-- global x
x = 10

-- local x
local x = 20

function f()
  x = x + 1
  print(x)
end

g = load("x = x + 1; print(x)")

-- traditional function uses the local version of x
f()

-- load function uses the global version of x
g()



