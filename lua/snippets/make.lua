local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local  i = ls.insert_node


return {
  -- Snippet for a basic C++ program with a Makefile
  s("cppmake", { 
    t({
      "CXX = g++",
      "CXXFLAGS = -Wall -Wextra -std=c++17",
      "TARGET = hello_world",
      "SRC = main.cpp",
      "",
      ".PHONY: clean",
      "",
      "$(TARGET): $(SRC)",
      "\t$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET)",
      "",
      "clean:",
      "\trm -f $(TARGET)",
    }),
    i(1, "make")
  })
}

