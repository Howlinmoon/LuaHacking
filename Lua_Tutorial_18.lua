-- Lua Tutorial #18 - Tables
t = { 1, 2, 3}

-- insert
-- defaults to appending
table.insert(t, 10)

-- specify location (2) and new element (99)
table.insert(t, 2, 99)

for k,v in ipairs(t) do
  print(k,v)
end
print("")

-- remove 
-- defaults to last
x = table.remove(t)

for k,v in ipairs(t) do
  print(k,v)
end
print("")
print("removed:", x)
print("")

t = { 5, 1, 13, 2 }
-- sort
-- defaults to ascending order
table.sort(t)
for k,v in ipairs(t) do
  print(k,v)
end
print("")

-- customize the sort with your own function
-- this function modifies the sort to return descending order
table.sort(t, function(a,b) return a > b; end)

for k,v in ipairs(t) do
  print(k,v)
end
print("")

-- concatanate tables

t = {"Julie", "Biff", "Clark", "Lucy", "Shirley" }

-- no separator
s = table.concat(t)

print(s)
print("")

-- with separator
s = table.concat(t, ", ")

print(s)
print("")
