-- Lua Tutorial - Changes with Lua 5.3

-- Lua 5.2 prints out 2, 2
-- Lua 5.3 now prints out 2, 2.0
print(2, 2.0)

-- returns float in both versions
print(2 / 3)


-- if _VERSION == "Lua 5.3" then
  -- integer division - in Lua 5.3
--  print( 2 // 3)
-- end

-- Deprecated functions
-- bit32: All, math: atan2, cosh, sinh, tanh, pow, frexp, ldexp


-- 5.3 - exponent operator
print(2^3)

-- bit32 operator still works - but don't use it
print(bit32.band(0xAF, 0xFA))
print(0xAF & 0xFA)

print(bit32.bor(0xAF, 0xFA))
print(0xAF | 0xFA)

print(bit32.bxor(0xAF, 0xFA))
print(0xAF ~ 0xFA)

-- not - this one has differences...
print(bit32.bnot(0xAF))
print(~0xAF)

print("0xAF = ", 0xAF)
-- bit shift left 2x, quad the value
print(bit32.lshift(0xAF, 2))
print(0xAF << 2)

-- right shift 16 2 times for 4
print(bit32.rshift(0x10, 2))
print(0x10 >> 2)

-- math changes - makes it quadrant aware
print(math.atan2(2, 3))

-- power
print(2^16)

-- added functions
-- move elements in a table to another - or simply a different spot

-- table.move(t1, startPoint, numberElements, newStartPoint[, t2])
-- defaults to same table - optionally, select a 2nd table

t1 = {1, 2, 3}
t2 = {99, 98, 97}

table.move(t1, 1, 2, 2, t2)

for i = 1, 3 do
  print(t1[i], t2[i])
end

-- results in
-- 1 99
-- 2 1
-- 3 2

-- 1, 2 has been moved (copied) to t2 over 98, 97

-- Strings
-- X, A, 1
print(utf8.char(88, 65, 49))

print(utf8.char(320))

-- iterator function
-- returns string position and its value
for p,c in utf8.codes("hello") do
  print(p,c)
end

print(utf8.codepoint("HeLlo XX", 2, 4))
-- prints codes for 'e', 'l' and 'L'

uft8String = "ĬĬĬŀŀĬĬĬ"
utf8Length = utf8.len(uft8String)
print(utf8Length)
-- length in bytes

-- utf8.offset
print(utf8.offset("Subject String", 3, 3))
-- returns a 5 - now very useful?

-- 

