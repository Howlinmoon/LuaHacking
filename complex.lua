-- complex module example
M = {}

M.printHello = function()
  print("Hello from inside the module!")
end

M.pi = 3.14159

M.t = { 1, 2, 3 }

return M

