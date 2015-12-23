-- Advanced Tables

-- the Player table
Player = {
  x = -99, y = -99,
  name = "default name",

  new = function()
    -- an empty table
    p = {}
    
    -- iterates through named keys such as x, y, name
    for k, v in pairs(Player) do
      -- flesh out the table
      p[k] = v
    end
    
    -- return our new instance - p
    return p
  end,

  move = function(p, x, y)
    p.x = p.x + x
    p.y = p.y + y
  end

}

p1 = Player.new()
p1.x = 10
p1.y = 20
p1.name = "George"


p2 = Player.new()
print(p2.x, p2.y, p2.name)
p2.x = 30
p2.y = 50
p2.name = "Fred"
print(p1.x, p1.y, p1.name)
print(p2.x, p2.y, p2.name)


p1.move(p1, 10,10)
p2.move(p2, 15, 15)
print(p1.x, p1.y, p1.name)
print(p2.x, p2.y, p2.name)

