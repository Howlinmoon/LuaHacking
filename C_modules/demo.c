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

  int n = lua_gettop(L);
  printf("%d values are on the stack right now.\n", n);


  print_stack(L);
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