-- Lua Tutorial #23 - OS Libary

-- os.time - returns Unix Time
print(os.time({year = 2016, month = 1, day = 7, hour = 12, min = 16, sec = 30, isdst = true}))

-- os.date - returns a time stamp

unixTime = os.time({year = 2016, month = 1, day = 7, hour = 12, min = 16, sec = 30, isdst = true})

t = os.date("*t")

for k,v in pairs(t) do
  print(k, v)
end

print(os.date("%Y/%B/%d"))
-- similar (same?) format codes.

for i = 1, 10000000 do
  d = i + 1
end
y = os.clock()

print("elapsed time is", y)

-- issue commands to the OS
-- os.execute("mkdir something")

print("sleeping 3 seconds")
os.execute("sleep 3")
print("Thank you for your patience")

