-- Lua Tutorial #13

-- define it
co = coroutine.create(function() 
    print("hello from co-routine");
    for i = 1, 5 do
      print(coroutine.status(co))
      print(i)
      coroutine.yield(i)
    end
  
  end)

-- call it

-- initial status
print(coroutine.status(co))

coroutine.resume(co)

coroutine.resume(co)

coroutine.resume(co)

coroutine.resume(co)

coroutine.resume(co)

coroutine.resume(co)

print(coroutine.resume(co))

print(coroutine.status(co))


co = coroutine.create(function(something, another)
    print("something, another is:", something, another)
    for i = 1, 5 do
      print("inside", coroutine.yield(i))
    end
  end)

-- first call sends 1,2 to 'something' and 'another'
print(coroutine.resume(co, 1, 2))
-- this call sends 3, 4 to the first instance of coroutine.yield(i))
print(coroutine.resume(co, 3, 4))
-- each successive call sends the pair of numbers to the next instance of coroutine.yield
print(coroutine.resume(co, 5, 6))
print(coroutine.resume(co, 7, 8))
print(coroutine.resume(co, 9, 10))
print(coroutine.resume(co, 10, 11))
print(coroutine.resume(co, 12, 13))

d = coroutine.wrap(function()
    for i = 1, 5 do
      print(i)
      coroutine.yield()
    end
  end)
  
-- try again with d
print("starting over with 'd'")
-- no coroutine.resume needed
d()
d()
d()
d()
d()
d()
-- one past the end results in an error about a dead coroutine
-- d()

