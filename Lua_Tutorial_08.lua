-- Tutorial #8, functions, Closures, etc

-- functions are variables...

f = function()
  return "hello"
end

print(f)

g = f

print(g)

-- functions are copied by reference - same as tables.

function f(g)
  return g()
end

function hello()
  print("hello from inside of fn hello")
end

something = f(hello)
print(something)

f(function() print("hello"); end)

-- a function that returns a function...

function f()
  local x = 15
  return function() print(x); end
end

printHello = f()

-- prints value of x
printHello()

-- x doesn't exist outside of the function...

print(x)
-- gives us nil

function createIter()
  local i = 0
  print("hello from inside of createIter")
  
  return function() print(i); i = i + 1; end
  
end

iter = createIter()

-- prints 0, 1, 2...
iter()
iter()
iter()


