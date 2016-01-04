-- Lua 5.2 Tutorial #19
-- Got confused with last tutorial - it was for Lua 5.1...

-- bit wise OR

print(bit32.bor(0x0, 0xF))

-- bit wise AND
print(bit32.band(0x0, 0xF))

-- bit wise XOR
print(bit32.bxor(0x0, 0xF))

-- bit wise NOT
print(bit32.bnot(0x0))

-- bit shift functions
-- left 2x = 4x value
print(bit32.lshift(0xF, 2))

-- right 2x = 1/4 value
print(bit32.rshift(0x20, 2))

-- left and right rotate functions
print(bit32.lrotate(0xF, 2))
print(bit32.rrotate(0xF, 2))

-- arithmetic shift
-- replaces shifted out bits with signal? bit

print(bit32.arshift(0xF, 2))

-- test (boolean)
print(bit32.btest(0xF, 0xF))

-- extract value to extract from, where to start, and how much from right to left
print(bit32.extract(0xABCDEF, 4, 8))
-- extracted 0xDE
-- print it as verification
print(0xDE)

-- bit replace
print(bit32.replace(0xABCDEF, 0xFF, 4, 8))
-- replaces the bits specified with the value specified
-- should results in 0xABCFFF
print(0xABCFFF)



