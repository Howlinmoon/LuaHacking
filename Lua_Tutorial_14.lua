-- Lua Tutorial #14

a = 10
b = "hello"
c = true

dontSkip = false

if dontSkip then
  -- print out all variables
  for k,v in pairs(_G) do
    print(k,v)
  end


  -- access a specific global variable
  _G["a"] = true

  print(a)

  x = 10
  io.write("enter the name of the variable to you want to be printed: ")
  index = io.read()

  f = loadstring("return " .. index)
  print(f())

  -- another way to do it
  print(_G[index])

end

print("skipped down to here")

setmetatable(_G, {__index = function(_ , n)
    print(n .. " is not an initialized variable.")
end})

-- now - test it
z = 10

print(_G["z"])

-- global x & a
x = 99
a = 5

-- local y & z
local y = 1
local z = 2

for k,v in pairs(_ENV) do
  print(k, v)
end

