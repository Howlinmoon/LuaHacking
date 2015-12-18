-- Derek Banas's Lua Tutorial
-- https://www.youtube.com/watch?v=iMacxZQMPXs

print("Hello World from Lua!")

-- Single Line Comment

--[[ multi line comment here
and here
and here
]]


name = "Jim"
io.write("Size of the name string: ", #name, "\n")

name = 4.5

print("name is now ", name)

bigNumber = 9223372036854775807

print("bigNumber = ", bigNumber)

bigNumber = bigNumber + 1
print("bigNumber + 1 = ", bigNumber)

io.write("bigNumber is of type:", type(bigNumber), "\n")

longString = [[
I am a very long string
that spans multiple
lines]]

io.write(longString, "\n")

-- concatenate

newBigString = longString .. longString .. longString

io.write(newBigString, "\n")


-- bool

isAbleToDrive = true

io.write(type(isAbleToDrive),"\n")

-- default value for all vars is...

io.write(type(madeUpVar), "\n")

-- simply outputs 'nil'

io.write("5 + 3 = ", 5 + 3, "\n")
io.write("5 - 3 = ", 5 - 3, "\n")
io.write("5 * 3 = ", 5 * 3, "\n")
io.write("5 / 3 = ", 5 / 3, "\n")
io.write("5 % 3 = ", 5 % 3, "\n")

-- random number, defaults to 0 - 1
io.write("math.random() : ", math.random(), "\n")

-- can specify the min and max

io.write("math.random(6) : ", math.random(6), "\n")

io.write("math.random(10,20) : ", math.random(10,20), "\n")

math.randomseed(os.time())

io.write("math.random(10,20) : ", math.random(10,20), "\n")

-- playing with pi

print(string.format("Pi to 10 decimal places is: %.10f", math.pi))

-- Relational Operators
-- >, <, >=, <=, ==, ~= (not equal)

-- Logical Operators
-- and, or, not

age = 70

if age < 16 then 
	io.write("You can go to school", "\n")
	-- a local to this if block variable
	local localVar = 10
elseif (age >= 16) and (age < 18) then
	io.write("You can drive legally", "\n")
else
	io.write("You can vote legally", "\n")
end

if (age < 14) or (age > 67) then io.write("You shouldn't be working\n")
end


print(string.format("not false = %s", tostring(not false)))

-- simulating the terninary operator
-- canVote = age > 18 ? true : false
-- via

canVote = age > 18 and true or false

io.write("can I vote: ", tostring(canVote), "\n")

-- Strings

quote = "this is a really really long string, I should be creating a unique password with it I guess, maybe, maybe not"

io.write("Quote length ",string.len(quote), "\n")

io.write("This is the shortcut method Quote length ",#quote, "\n")

-- replace substring

io.write("Replace I with Me ", string.gsub(quote, "I", "Me"), "\n")

-- find the index of a substring
io.write("The index of password is ", string.find(quote, "password"), "\n")

-- upper or lower case modification
io.write("In all lowercase: ", string.lower(quote), "\n")
io.write("In all uppercase: ", string.upper(quote), "\n")

-- while loop

i = 1

while ( i <= 10) do
	io.write(i)
	i = i + 1

	if i == 8 then break end
end
print("\n")

--[[
-- repeat statement
io.write("secret answer is 15\n\n")
repeat
	io.write("Enter your guess: ")
	guess = io.read()
until tonumber(guess) == 15
]]

io.write("Back in business\n")

-- for statements

for i = 1, 10, 1 do
	io.write("count is now ",i,"\n")
end

months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}

for key, value in pairs(months) do
	io.write(value, "\n")
end

aTable = {}
for i = 1, 10 do
	aTable[i] = i
end

io.write("First: ", aTable[1], "\n")
io.write("Number of items in table: ", #aTable, "\n")


table.insert(aTable, 1, 0)
io.write("First: ", aTable[1], "\n")

stringTable = table.concat(aTable, ", ")
io.write(stringTable, "\n")

table.remove(aTable, 5)
stringTable = table.concat(aTable, ", ")
io.write(stringTable, "\n")

-- multidimensional table
-- reminder, '..' concats strings
aMultiTable = {}
for i = 0, 9 do
	aMultiTable[i] = {}
	for j = 0, 9 do
		aMultiTable[i][j] = tostring(i*5) .. tostring(j*6)
	end
end

io.write("Table[0][0]: ", aMultiTable[3][4], "\n")

for i = 0, 9 do
	for j = 0, 9 do
		io.write(aMultiTable[i][j], " : ")
	end
	io.write("\n")
end


-- basic functions
function getSum(num1, num2)
	return num1 + num2
end

print(string.format("5 + 2 = %d\n", getSum(5,2)))

function splitStr(theString)
	stringTable = {}
	local i = 1

	for word in string.gmatch(theString, "[^%s]+") do
		stringTable[i] = word
		i = i + 1
	end

	return stringTable, i
end

splitStrTable, numOfStr = splitStr("The Turtle Crossed The Road Quickly")

for j = 1, numOfStr do
	print(string.format("%d : %s", j, splitStrTable[j]))
end

-- more complex functions
-- ... indicates unknown amount of arguments
function getSumMore(...)
	local sum = 0

	for k, v in pairs{...} do
		sum = sum + v
	end

	return sum
end

io.write("Sum ", getSumMore(1,2,3,4,5,6,7,8,9,10), "\n")


-- assigning a function to a var

doubleIt = function(x) 
	return x * 2
	end

print(doubleIt(4))


-- example of an enclosure
-- and enclosure can access local variables of an enclosing function
-- thus the anonymous function is the enclosure - the enclosing function
-- would have to be 'outerFunc'

function outerFunc()
	local i = 10
	print("outfunction says i is",i,"\n")
	return function()
		-- 
		i = i + 1
		return i
	end
end

getI = outerFunc()

print(getI())
print(getI())
print(getI())
print(getI())
print(getI())


-- coroutine

co = coroutine.create(function()
	for i = 1, 10, 1 do
		print(i)
		print(coroutine.status(co))
		if i == 5 then
			coroutine.yield()
		end
	end
end)

print("before resume",coroutine.status(co))
coroutine.resume(co)
print("after resume", coroutine.status(co))

co2 = coroutine.create(function()
	for i = 101, 110, 1 do
		print(i)
	end
end)

coroutine.resume(co2)
-- co was suspend partway - so this will resume where it left off!
coroutine.resume(co)
print("after 2nd resume", coroutine.status(co))
-- further attempt at resume does nothing
coroutine.resume(co)

-- file.io
-- r: read only (default)
-- w: overwrite or create a new file
-- a: append or create a new file
-- r+: read and write existing file
-- w+: overwrite read or create file
-- a+: append read or create file

-- create the file
file = io.open("test.lua", "w+")

-- write to it
file:write("Random String of Text\n")
file:write("Another Second Random String of Text\n")

-- back to begining of file
file:seek("set", 0)

-- read from the file
print(file:read("*a"))

-- close the file
file:close()

-- not sure if this is supposed to append to the previous or not...
-- open file in append and read mode
file = io.open("text.lua", "a+")

-- write to it first
file:write("Even more text\n")

-- seek back to the beginning so we can read
file:seek("set", 0)

-- read...
print(file:read("*a"))

-- close it
file:close()

-- Modules

convertModule = require("convert")
print(string.format("%.3f cm", convertModule.ftToCm(12)))

-- Meta Tables
-- Continue with 45:32

aTable = {}
for x = 1, 10 do
	aTable[x] = x
end

for y = 1, #aTable do
	print("aTable entry ", y, "is ", aTable[y])
end

-- Meta Table
mt = {
--	_sub _mul _div _mod _concat
	__add = function(table1, table2)
	print("table1 length: ", #table1)
	print("table2 length: ", #table2)
	sumTable = {}
	for y = 1, #table1 do
		if (table1[y] ~= nil) and (table2[y] ~= nil) then
			print("for y = ", y, "table1 and table2 is not nil")
			sumTable[y] = table1[y] + table2[y]
		else
			print("for y = ", y, "table1 or table2 is nil")
			sumTable[y] = 0
		end
	end

	return sumTable
end,

	__eq = function(table1, table2)
		return table1.value == table2.value
	end,

	__lt = function(table1, table2)
		return table1.value < table2.value
	end,

	__le = function(table1, table2)
		return table1.value <= table2.value
	end,
}

setmetatable(aTable, mt)

print(aTable == aTable)

addTable = {}
addTable = aTable + aTable

for z = 1, #addTable do
	print(addTable[z])
end


-- Lua's version of OOP fakery

Animal = {height = 0, weight = 0, name = "No Name", sound = "No Sound" }

function Animal:new (height, weight, name, sound)
	setmetatable({}, Animal)

	self.height = height
	self.weight = weight
	self.name = name
	self.sound = sound

	return self
end

function Animal:toString()
	animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall and says %s", self.name, self.weight, self.height, self.sound)
	return animalStr
end

spot = Animal:new(10, 15, "Spot", "Woof")

print(spot.weight)

print(spot:toString())

Cat = Animal:new()

function Cat:new (height, weight, name, sound, favFood)
	setmetatable({}, Cat)

	self.height = height
	self.weight = weight
	self.name = name
	self.sound = sound
	self.favFood = favFood

	return self
end

function Cat:toString()
	animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall and says %s and loves %s", self.name, self.weight, self.height, self.sound, self.favFood)
	return animalStr
end

fluffy = Cat:new(10,15, "Fluffy", "Meow", "Tuna")

print(fluffy:toString())

