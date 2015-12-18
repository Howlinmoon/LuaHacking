io.write("Hello, and welcome to Lua!", "\n")
print("Using a traditional print - Hello World!", "\n")


-- simple variable declaration stuff
x = 10
-- can't get any simpler
-- x is a "number" variable - not an integer...

print(x)

-- concat example

exampleVar = "Hello" .. " World"
print(exampleVar)


thisVar = "12345 ABCDEF Hello"
print(#thisVar)

-- simple vars, both considered "True"
a = 10
b = 20

-- returns b
print (a and b)

-- returns b
print(a or b)

print(b < a or "This statement is false")

-- order of operation demo

-- a + 11 is evaluated before ">", thus, this is true
print(a + 11 > b or "this statement is false")

print(not (a + 11 > b) or "This statement is true")

-- Left off Tutorial #3 ad 15:08


-- if statements


if 10 > 5 then
  print("10 appears to be greater than 5\n")
end


if 5 > 10 then
  print("5 appears to be greater than 10\n")
else
  print("5 is not greater than 10\n")
end

