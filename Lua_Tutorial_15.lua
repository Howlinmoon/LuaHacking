-- Lua Tutorial #15 - Weak Tables and Finalizers

-- __mode metafield, defines whether the table has weak keys or not

t = {}
-- this mode switch forces the table to be garbage collected
-- v = weak values, k = weak keys
setmetatable(t, {__mode = "v"} )
x = {}

-- this reference to x normally keeps it from being garbage collected
t.x = {}
-- display the table Id
print(t.x)
x = nil
-- force a garbage collection cycle
collectgarbage()
-- table is now destroyed
print(t.x)

-- weak key example
print("weak key example")
 j = {}
 setmetatable(j, {__mode = "k"})
 z = {}
 j[z] = "hello"
 print(j[z])
 -- re-create table z using a different table Id
 z = {}
 j[z] = "hello2"
 print(j[z])
 print("before garbage collecting")
 for _, v in pairs(j) do
   print(v)
end
 collectgarbage()
 print("after garbage collecting")
 for _, v in pairs(j) do
   print(v)
end


-- you can use both "kv" for weak keys and values

