--Lua Tutorial #14 part 3
x = 10

-- new default environment for load
env = {}

-- specify the environment to save its vars in
load("x = 20", _, "bt", env)()


print(x)

-- access the 'x' in load's environment
print(env.x)



