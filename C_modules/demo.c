// demo.c
//
// A skeleton Lua module written in C.
//

#include "printstack.h"

#include "lua.h"
#include "lauxlib.h"

// lua_pushboolean
// lua_pushstring
// lua_pushnil
// lua_pushnumber

// lua_pushlstring
// lua_pushfstring


// stack commands
// lua_checkstack
// lua_gettop
// lua_settop
// lua_insert
// lua_pop
// lua_pushvalue
// lua_remove
// lua_replace



int f(lua_State *L) {
  // adjust the size of the stack to 50 (?)
  lua_checkstack(L, 50);
    // stack = [<args>]
    // Add a number to the stack
  lua_pushnumber(L, 12.3);
    // stack = [<args>, 12.3]
  lua_pushstring(L, "Pushed onto the stack");
    // stack = [<args>, 12.3, "Pushed onto the stack"]
  lua_pushboolean(L, 1);
    // stack = [<args>, 12.3, "Pushed onto the stack", true]
  lua_pushnil(L);
    // stack = [<args>, 12.3, "Pushed onto the stack", true, nil]
  lua_insert(L, -3);
    // stack = [<args>, 12.3, nil, "Pushed onto the stack", true]

    // remove the topmost value from the stack
  lua_pop(L, 1);
    // stack = [<args>, 12.3, nil, "Pushed onto the stack"]

    // remove from an abitrary position (3rd from right - or '12.3' is removed)
  lua_remove(L, -3);
    // stack = [<args>, nil, "Pushed onto the stack"]

    // opposite of remove is push... (counting from the left or 'nil')
  lua_pushvalue(L, 1);
    // stack = [<args>, nil, "Pushed onto the stack", nil]

    // replace the top value on the stack with entry #3
//  lua_replace(L, -3);
    // stack = [<args>, nil, "Pushed onto the stack"]

    // stack = [<args>, nil, "Pushed onto the stack", nil]
//  lua_replace(L, 2);
    // stack = [<args>, nil, nil]

    // stack = [<args>, nil, "Pushed onto the stack", nil]
  lua_replace(L, 3);
    // stack = [<args>, nil, "Pushed onto the stack"]

    //> f(1, 2, 3, 4)
    // 6 values are on the stack right now.
    // stack: 1 2 1 4 nil 'Pushed onto the stack'

  // in the above example, 1, 2, 3, 4 - '3' was replaced with the top of the stack or '1'

  // check and see if the first argument is a string...?
  int isString = lua_isstring(L, 1);
  printf("is the first stack item a string? %d\n", isString);


  int n = lua_gettop(L);
  printf("%d values are on the stack right now.\n", n);


  print_stack(L);

  if (isString == 1) {
    printf("The first item is a String\n");
  } else {
    printf("The first item is not a String\n");
  }


  return 3;
}

int g(lua_State *L) {
      // stack = [<args>]
  print_stack(L);
  return 0;
}


#define setup_global_fn(fn_name) \
  lua_pushcfunction(L, fn_name); \
  lua_setglobal(L, #fn_name);

int luaopen_demo(lua_State *L) {
  setup_global_fn(f);
  setup_global_fn(g);
  return 0;
}