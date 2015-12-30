-- Lua Tutorial 15 part 2

-- starting finalizers
-- finalizer is a function that is ran when it (table) is garbage collected

t = {x = 1}
setmetatable(t, {__gc = function(o) print("Table t is being garbage collected!", o.x); end })
-- wipe t out
t = nil
-- trigger the garbage collection
collectgarbage()

print("Second example")
t = { x = 2 }
mt = {__mode = "k", __gc = true }
setmetatable(t, mt)
-- attempting to create a finalizer like this doesn't work!
-- unless you add ", __gc = true" as in above
mt.__gc = function(o) print("Table t is being garbage collected (again)!"); end
t = nil
collectgarbage()

