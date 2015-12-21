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



if 10 < 5 then
  print("10 is < 5?!")
elseif 20 < 15 then
  print("20 is < 15?!")
elseif 30 > 20 then
  print("30 is greater than 20")
else
  print("None of these statements are true!")
end



-- similar to python
-- lua can check the type of objects

print(type(20))

testVar = "something cool"
testVar = true

if type(testVar) == "number" then
  print("testVar is a number")
elseif type(testVar) == "string" then
  print("testVar is a string")
else
  print("I don't know what testVar is")
end



-- Loops

-- while loop
iter = 0
while iter <= 10 do
  print(iter)
  iter = iter +1
end


-- for loop
for i = 0, 10 do
  print(i)
end

-- for loop with non-default increment

for i = 0, 10, 2 do
  print(i)
end


-- Continue at 5:28 of Part 4 - Loops

-- repeat until loop
-- same as 'do...while' type loops
-- always runs at least once

iter = 20
repeat 
  print(iter)
  iter = iter + 1
until iter > 10


-- Control statements
-- actually only a single one - 'break'

for i = 0, 10 do
  print(i)
  if i == 5 then
    break
  end
end

