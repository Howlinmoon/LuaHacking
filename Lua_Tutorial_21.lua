-- Lua Tutorial #21 - String Library part 2

s = "This is a string"

print(string.find(s, "is"))

-- returns 3,4 representing Th[is]

-- optional start position
print(string.find(s, "is", 5))
-- returns 6,7 representing This [is]

-- looking for a single char
print(string.find(s, "i", -4))
-- 4 positions from the right
-- it then looks in the final 4 chars or
-- This is a st[ring]
-- and returns the "i"

-- simpler - is match
print(string.match(s, "tr"))
-- returns what it matched - in this case, 'tr'

-- global match - returns all matches
local spaces = 0
for _ in string.gmatch(s, " ") do
  spaces = spaces + 1
end

print(string.format("There are %d spaces", spaces))

-- gsub replaces target string with replacement string
print(string.gsub(s, "i", "XX"))
-- all 'i' are replaced with 'XX'
-- 3 i's were replaced

-- can also limit the amount of replacements done
print(string.gsub(s, "i", "XX", 2))
-- limit to 2

--[[
pattern matching characters - like Perl Regexp

. --all characters
%a  - letters
%c  - control characters, \t, \n etc
%d  - digits
%g  - printables - except space
%l  - lower case letters
%p  - punctuation
%s  - spaces
%u  - upper case letters
%w  - alphanumerics - letters and numbers
%x  - hexadecimal numbers

-- upper case versions of the above is their negatives

+ | - one or more
* | - zero or more
- | - zero or more lazy
? | - zero or one occurrence
^ - start from beginning
$ - anchor to end

[] - char set
() - captures

%bxy -- match anything between opening(x) and closing(y)

]]


s = "This is still a string 12345"
print(string.gsub(s, "%A", "_"))
-- replaces all non-letters with underscores

print(string.gsub(s, "%s", "_"))
-- replaces spaces with underscores

s = "Today is 01/05/2016 which is a Monday"
-- grab the date portion from the string
print(string.match(s, "%d%d/%d%d/%d%d%d%d"))
-- returns 01 05 2016 portions

-- more efficient method - matches one or more for each block
print(string.match(s, "%d+/%d+/%d+"))
-- returns 01 05 2016 portions


s = "Today is 1/6/2016 (January sixth, 2016 )."
print(string.match(s, "%(%s*.*%s*%)"))

s = "The number is ...54"
-- only matches last period!
print(string.match(s, "%.?%d+"))

print("lazy repetitions")
-- lazy repetitions
s = "int x = 0; /* init x */ int y = 0; /* init y */"
print(string.match(s, "/%*.-%*/"))


-- anchors
s = "2 Hello World 5"
print(string.match(s, "^%d"))
-- prints 2

print(string.match(s, "%d$"))
-- prints 5

print("turning vowels into underscores")
s = "This is a String with a number 25"
print(string.gsub(s, "[aeiouAEIOU]", "_"))

-- ranges
s = "1234567890ABCDEF"
-- match just 0 through 7
print(string.gsub(s, "[0-7]", "_"))

print("matching everything but 'A'")
print(string.gsub(s, "[^A]", "_"))

print("something with a number")
s = "This is a number: -12.25"
print(string.match(s, "[+-]?%d+%.?%d*]?"))

-- captures

s = "num1 = 2, num2 = 3"
-- grabs just num1 and its value
print(string.match(s, "([_%a][_%w]*)%s*=%s*(%d+)"))
-- returns num1 and 2

-- capture the values into the variables
var,value = string.match(s, "([_%a][_%w]*)%s*=%s*(%d+)")

print(var)
print(value)

-- somewhat more complex
s = "[[init num]] name = \"Bob\" --move on"
print(string.match(s, "([_%a][_%w]*)%s*=%s*([\"'])(%a+)%2"))

-- matching between opening and closing

s = "This is in parantheses: (hello)"
print(string.match(s, "%b()"))


print("frontier pattern")
-- last example
s = "dogcat cat catfish strcat"
print(string.gsub(s, "%f[%a]cat%f[%A]", "dog"))
-- matches/substitutes only the lone 'cat'

-- replacements
s = "$varname = $value"
varname = "var"
value = "2"
print(string.gsub(s, "$(%w+)", _G))






