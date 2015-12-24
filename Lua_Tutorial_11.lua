-- Lua Tutorial #11

t = { one = 1, two = 2, three = 3 }

for k, v in pairs(t) do

  print(k, v)
  
end


print ("\n")

t = { 1, 2, 3 }

t[2] = nil

print("t is length", #t)

print("Numeric for..loop")
for i = 1, 3 do
 
  print(i, t[i])
 
end

print("\n")

print("ipairs for..loop")
for k, v in ipairs(t) do

  print(k, v)
  
end



print("Starting new section with a function")
t = { 1, 2, 3, 4, 5 }

function numIter(t, start)
  i = start
  return function()
    i = i + 1
    if t[i-1] then
      return i - 1, t[i-1]
    else
      return nil
    end
  end
end

for k, v in numIter(t, 3) do
  print(k,v)
end



