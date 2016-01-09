-- Lua Tutorial #25 - Miscellaneous

print(assert(true, "OH NO!"))

-- create an error

-- error("Program Failed")

t = {1, 2, 3}
-- display the contents of index 2 + 1
print(next(t, 2))

function f(x)
  error(x)
  return x
end

print("demonstrating pcall - true means no error")
print(pcall(f, 10))
print("Still running")

-- raw means ignore any meta tables
--rawequal(t1, t2), rawget(t, i), rawlen(t), rawset(t, i, v)

-- print AF (hex) in decimal
print(tonumber("AF", 16))

-- change number to a string
print(tostring(11))

-- similar to python - tells you the type
print(type(12))

print("This is Lua version:")
print(_VERSION)
