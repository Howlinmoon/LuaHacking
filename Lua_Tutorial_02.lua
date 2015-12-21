-- Tables

t = {1, "hello", true}

-- one based, not zero based!
print(t[2])
-- prints 'hello'

-- again with key/value

t = { first = 1, second = "hello", third = true }

-- returns nil
print(t[2])

-- returns 'hello'

print(t['second'])

-- returns true
print(t.third)

-- size of '#' works on tables and strings
t = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
print("size of table t:",#t)

-- basic functions
-- definition
function f()
  print("Hello from function f")
end

-- calling the function
f()

g = function()
  print("hello from function originally named 'g'")
end

-- call g
g()

-- copy the g function to the var 'another'
another = g

-- call the copy
another()

function println(textToPrint)
  print(textToPrint,"\n")
end

println("hello, hello")
println("hello again!")

function addPrint(a, b)
  print(a + b)
end

-- prints 20 + 30 or 50
addPrint(20, 30)

-- return values

function add(a, b)
  return a + b
end

sum = add(20, 25)
print("sum is", sum)

-- scopes of variable

x = 10

function lameFunc(a, b)
  print("x is really", x)
  return a * b
end

print(lameFunc(10,13))
print("x is now",x)

-- declaring a var locally to a function

function localFunc(t)
  xlocal = 25
  print("localFunc t = ", t)
end

localFunc(100)
print("x from localFunc is now:", x)

-- lua assumes all vars are global unless specified as local!

localVar = 99
function localDemo(r)
  local localVar = 19
  print("in localDemo, localVar = ", localVar)
  return r * 20
end

-- call localDemo
localDemo(14)

-- attempt to access 'localVar'

print("in global land, localVar is:", localVar)

--  left off with the beginning of tutoral #7
-- Memory Management


