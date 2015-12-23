-- Lua Tutorial #10, OOP and Meta Tables
-- Colon vs Dot syntax

Vector2 = {
  x = 0, y = 0,
  
  mt = {},
  
  New = function()
    local vec = {}
    
    vec.x = Vector2.x
    vec.y = Vector2.y
    vec.mt = Vector2.mt
    vec.Translate = Vector2.Translate
    
    return vec
    
  end,
  
  Translate = function(self, dx, dy)
    
    self.x = self.x + dx
    self.y = self.y + dy
  end
  
}

v1 = Vector2.New()
v1.x = 10
v1.y = 20

-- call it
-- have to pass a reference to ourself...
v1.Translate(v1, 10, 10)

print(v1.x, v1.y)

-- calling it with : notation - self is implied
v1:Translate(25, 17)

print(v1.x, v1.y)


-- Meta Tables
Vector2 = {
  x = 0, y = 0,
  
  mt = {},
  
  New = function()
    local vec = {}
    
    setmetatable(vec, Vector2.mt)
   
   -- __index deprecates the following commented out code
  --  vec.x = Vector2.x
  --  vec.y = Vector2.y
  --  vec.mt = Vector2.mt
  --  vec.Translate = Vector2.Translate
    
    return vec
    
  end,
  
  Translate = function(self, dx, dy)
    
    self.x = self.x + dx
    self.y = self.y + dy
  end
  
}


-- addition
Vector2.mt.__add = function(v1, v2)
  local vec = Vector2.New()
  
  vec.x = v1.x + v2.x
  vec.y = v1.y + v2.y
  
  return vec
end


-- subtraction
Vector2.mt.__sub = function(v1, v2)
  local vec = Vector2.New()
  
  vec.x = v1.x - v2.x
  vec.y = v1.y - v2.y
  
  return vec
end

v1 = Vector2.New()
v1.x = 10
v1.y = 20

v2 = Vector2.New()
v2.x = 30
v2.y = 40

-- this operation uses our meta table function __add we created
v3 = v1 + v2

-- and print out the results
print(v3.x, v3.y)

-- v4 uses the subtraction meta method
v4 = v1 - v2

print(v4.x, v4.y)

-- others

-- __mul, __div, __mod,
-- relationals
-- __eq, __lt, __le, __gt, __ge

Vector2.mt.__eq = function(v1, v2)
  -- returns true or false
  return v1.x == v2.x and v1.y == v2.y
end

-- this results in false, since v1 and v2 are different
print(v1 == v2)

-- this should return true
print(v1 == v1)


-- to string

Vector2.mt.__tostring = function(vec)
  
  return "(" .. vec.x .. ", " .. vec.y .. ")"

end

v3 = v1 - v2
-- implicitly calls the tostring function
print(v3)

Vector2.mt.__metatable = "Private"

print(getmetatable(v3))
-- this defines how one normally removes a table
-- setmetatable(v3, nil)

-- Index and New Index

-- the following is used when a variable doesn't exist yet
Vector2.mt.__index = Vector2

v1 = Vector2.New()
v1.x = 10
v1.y = 20
v1:Translate(10, 10)
print(v1)


-- new index method

Vector2.mt.__newindex = function(t, k, v)
  error("Cannot change values of vector2 instance.")
end

v1 = Vector2.New()
v1.x = 10
v1.y = 20

