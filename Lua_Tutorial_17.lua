-- Lua Tutorial #17 - Math Functions

math.abs(-50)
math.pi
math.sin(math.pi)
math.cos(math.pi)
math.tan(math.pi)
math.asin(3/5)
math.acos(4/5)
math.atan(3/4)
math.atan2(3, 4)
math.deg(math.pi)
math.rad(180)
math.sinh(1)
math.cosh(1)
math.tanh(1)
math.floor(0.5)
math.ceil(0.5)
math.pow(2, 6)
math.sqrt(64)
math.exp(10)
math.log(10)
math.log10(1000)
math.min(2,3)
math.max(2,3,1,5,18)
math.modf(10.2)
math.randomseed(os.time())
math.random()
math.random(10)
math.random(50, 100)
math.frexp(3)
math.ldexp(0.75, 2)
math.huge
math.fact = function(n)
  if n == 0 then return 1; end
  return n * math.fact(n - 1)
end

