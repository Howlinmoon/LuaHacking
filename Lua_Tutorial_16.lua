-- Lua Tutorial #16 - Modules
c = require("complex")

-- this should access M...

c.printHello()

print(c.pi)

for _, v in pairs(c.t) do
  print(v)
end

