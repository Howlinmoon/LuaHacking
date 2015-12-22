-- Memory Management - Tutorial #7

x = 10

-- same allocated memory - different value
x = 20

print(x)

-- trigger cleanup
x = nil

x = 10
y = x
print(x)
print(y)

-- the variables are not referring to the same memory
x = 25
print(x)
print(y)

-- with tables - they refer to the same object...

x = {10, 20, 30, 40, 50}
y = x

print(x[2])
print(y[2])

-- adjust the table
x[2] = 40
-- and y follows x's lead..
print(x[2])
print(y[2])

x = nil
-- table still exists in y
print(y[2])

-- destroy the table
y = nil



