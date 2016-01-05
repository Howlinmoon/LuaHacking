-- Strings Part 1

-- showing strings are passed by value, instead of reference
s = 'hello'
t = s
print(1)
t = 'hi'

print(s, t)

-- can't iterate strings like you can in Python
print(s[2]) -- does not return 'e'

-- length - including using the shortcut
print(string.len(s))
print(#s)
print(s:len())

-- duplicate the string, x amount of times
print(string.rep(s, 5))

-- lower and upper case

s = 'Hello Dear World'
print(s:lower())

print(s:upper())

-- substring - first char to 5th from end
print(s:sub(1, -5))

newString = s:sub(1, -5)
print(newString)

-- bin to ascii
print(string.char(88))

-- ascii to bin
print(string.byte('X'))

-- select position 2, 'Y'
print(string.byte('XYZ', 2))

print(s:byte(1))

-- format string
-- %s String, %d number, %f floating point, %o Octal, %x Hex, 
print(string.format("Hello, my name is %s and I am %d years old.", "Bob", 35))
print(string.format("27 in Octal is %o, and 27 in hex is %x", 27, 27))

-- floating point example
print(string.format("123.456 formatted to two places after the decimal point is %.2f", 123.456))

