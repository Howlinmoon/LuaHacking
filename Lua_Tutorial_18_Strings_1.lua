-- Lua Tutorial 18 Also - The String Library

print(string.lower("HELLO WORLD IN UPPERCASE"))
print(string.upper('hello world in lowercase'))

-- sub
s = "(hello)"
-- start with 2nd char and print to 2nd last char
print(s:sub(2, -2))

-- return ascii char
print(string.char(88))

-- return binary
-- specifying the index of the first char - 'X'
print(string.byte("Xa3", 1))

-- string formatting options
print(string.format("%02d/%02d/%04d", 05, 04, 2014))
  
print(string.format("%.4f", math.pi))

-- find
s = "hello world"
print(s:find("hello"))

-- returns 1, 5 - where hello starts - and where it ends

-- pattern matching
print(s:match("world"))

-- sub
print(s:gsub("hello", "goodbye"))

-- returns the number of changes made

for w in s:gmatch("l") do
  print(w)
end


