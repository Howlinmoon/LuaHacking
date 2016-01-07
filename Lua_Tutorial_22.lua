-- Lua Tutorial #22 - The IO Library

-- redirect output from stdout to a file
io.output("targetOutput.txt")
io.write("This is being sent to targetOutput.txt\n")

print("This still goes to std out")

-- back to normal
io.output(io.stdout)
io.write("This is back to std out\n")

io.input("input.txt")
print(io.read())

-- back to normal
io.input(io.stdin)

-- get input from the user
-- print(io.read())

-- back to reading the file again
io.input("input.txt")

-- create an empty table for storage
t = {}

print("reading in the text file line by line")
for i = 1, math.huge do
  local s = io.read()
  if s == nil then
    break
  end
  
  t[#t + 1] = s
end

for i = 1, #t do
  print(t[i])
end

print("simpler method output")
-- need to reset our input pointer back to beginning of file
io.input("input.txt")
-- simpler way to do the above
for s in io.lines() do
  print(s)
end

-- done

-- need to reset our input pointer back to beginning of file
io.input("input.txt")

-- by default, io.read does a single line
print(io.read("*l"))
print(io.read("*L"))
-- read entire file
print(io.read("*a"))

-- need to reset our input pointer back to beginning of file
io.input("input.txt")
-- read a single line of numerics
print(io.read("*n"))

-- read a specified length - such as 5
print(io.read(5))

-- open a file handle 'out' for writing
local out = assert(io.open("output.txt", "w"))
out:write("Hello in the file\n")

-- back to std out
io.write("Back to standard output\n")

-- input version
local inp = assert(io.open("newInput.txt", "r"))
print(inp:read())

-- back to standard input
-- back to normal
io.input(io.stdin)

--print(io.read())

-- input version
local inp = assert(io.open("newInput.txt", "r"))
--print(inp:read())

-- close file handles
out:close()
inp:close()

io.stderr:write("OH NO AN ERROR! - Psych!\n")

local out = assert(io.open("output.txt", "w"))
-- wipe out the contents of the current file
out:flush()

print("Attempting to read the first line of input.txt twice")
-- proper method to reset pointer to beginning of file
local inp = assert(io.open("input.txt", "r"))

-- print first line
print(inp:read())

-- reset to first line again
inp:seek("set")  -- cur, -- end

-- print first line
print(inp:read())

-- start at the 5th byte
inp:seek("set", 5)

-- print from where we left off (seeked to)
print(inp:read())

-- read and write binary files - append "b" to the mode
-- i.e. rb and wb...

