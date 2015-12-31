-- Lua Tutorial #16 - Modules
c = require("complex")

-- this should access M...

-- c.printHello()

-- print(c.pi)

--for _, v in pairs(c.t) do
--  print(v)
--end


-- using the global variable from the module
-- before making M local in the module
-- M.printHello()


c1 = c.new(2, 5)
c2 = c.i
c3 = c.new(4, 8)

print("c2 = ", c2)

print("complex add")
r1 = c.add(c1, c2)
print(r1.r, r1.i)

print("complex sub")
r2 = c.sub(c1, c2)
print(r2.r, r2.i)

print("complex mul")
r3 = c.mul(c1, c3)
print(r3.r, r3.i)

print("complex abs")
r4 = c.abs(c1)
print(r4)


